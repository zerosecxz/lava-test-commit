#!/bin/bash

RPC_URL="https://rpc.starknet.lava.build/lava-referer-8247b742-4670-47af-9954-a3d32d28343a/"

OUTPUT_DIR="logs"

starknet_data=$(curl -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","id":"1","method":"starknet_blockNumber"}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    echo "$starknet_data" >> "$OUTPUT_DIR/starknet.txt"
    
    echo "StarkNet data fetched and saved to $OUTPUT_DIR/starknet.txt."
else
    echo "Failed to fetch StarkNet data."
fi
