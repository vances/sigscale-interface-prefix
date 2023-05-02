// prefix.smithy
// A service to manage address prefix matching tables


// Tell the code generator how to reference symbols defined in this namespace
metadata package = [
	{
		namespace: "org.sigscale.interfaces.prefix",
		crate: "sigscale_interface_prefix"
	}
]

namespace org.sigscale.interfaces.prefix

use org.wasmcloud.model#wasmbus
use org.wasmcloud.model#U32

/// The PrefixTable service has methods for table and row lifecycle management
@wasmbus(
	contractId: "sigscale:prefixtables",
	actorReceive: true,
	providerReceive: true
)
service PrefixTables {
	version: "0.1",
	operations: [ CreateTable, DestroyTable, InsertPrefix, RemovePrefix, MatchPrefix ]
}

/// Creates a prefix table
operation CreateTable {
	input: CreateTableRequest
	output: CreateTableResponse
}

/// Destroys a prefix table
operation DestroyTable {
	input: DestroyTableRequest
	output: DestroyTableResponse
}

/// InsertPrefix a prefix in a table
operation InsertPrefix  {
	input: InsertPrefixRequest
	output: InsertPrefixResponse
}

/// RemovePrefix a prefix from a table
operation RemovePrefix {
	input: RemovePrefixRequest
	output: RemovePrefixResponse
}

/// MatchPrefix an address in a prefix table
operation MatchPrefix {
	input: MatchPrefixRequest
	output:MatchPrefixResponse
}

/// Parameters sent for CreateTable
structure CreateTableRequest {
    /// Table name
    @required
    name: String,
}

/// Response to CreateTable request
structure CreateTableResponse {
    /// Indicates a successful table creation
    @required
    success: Boolean,

    /// Optional string w/rejection reason
    failReason: String,
}

/// Parameters sent for DestroyTable
structure DestroyTableRequest {
    /// Table name
    @required
    name: String,
}

/// Response to DestroyTable request
structure DestroyTableResponse {
    /// Indicates a successful table destruction
    @required
    success: Boolean,

    /// Optional string w/rejection reason
    failReason: String,
}

/// Parameters sent for InsertPrefix
structure InsertPrefixRequest {
    /// Table name
    @required
    name: String,

    /// Prefix
    @required
    prefix: String,

    /// Value
    @required
    value: U32
}

/// Response to InsertPrefix request
structure InsertPrefixResponse {
    /// Indicates a successful insertion
    @required
    success: Boolean,

    /// Optional string w/rejection reason
    failReason: String,
}

/// Parameters sent for RemovePrefix
structure RemovePrefixRequest {
    /// Table name
    @required
    name: String,

    /// Prefix
    @required
    prefix: String,
}

/// Response to RemovePrefix request
structure RemovePrefixResponse {
    /// Indicates a successful removal
    @required
    success: Boolean,

    /// Optional string w/rejection reason
    failReason: String,
}

/// Parameters sent for MatchPrefix
structure MatchPrefixRequest {
    /// Table name
    @required
    name: String,

    /// Address
    @required
    address: String,
}

/// Response to MatchPrefix request
structure MatchPrefixResponse {
    /// Indicates a successful find
    @required
    success: Boolean,

    /// Value
    @required
    value: U32,

    /// Optional string w/rejection reason
    failReason: String,
}

