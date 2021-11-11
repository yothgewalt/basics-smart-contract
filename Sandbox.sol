// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Sandbox {
    mapping(address => uint) _cryptocurrency_wallet;
    uint _totalSupply;
    
    function deposit() public payable {
        _cryptocurrency_wallet[msg.sender] += msg.value;
        _totalSupply += msg.value;
    }
    
    function withdraw(uint volume) public payable {
        require(volume <= _cryptocurrency_wallet[msg.sender], "Your balance isn't enough.");
        payable(msg.sender).transfer(volume);
        _cryptocurrency_wallet[msg.sender] -= volume;
        _totalSupply -= volume;
    }
    
    function checkBalance() public view returns(uint) {
        return _cryptocurrency_wallet[msg.sender];
    }
    
    function checkTotalSupply() public view returns(uint) {
        return _totalSupply;
    }
}