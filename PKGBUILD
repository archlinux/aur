# Maintainer: Daniel Kirchner <daniel at ekpyron dot org>

_gitname=cpp-ethereum
pkgname=('cpp-ethereum-solidity-tester')
pkgdesc="Ethereum C++ client - version used to test solidity"
pkgver=20180620
pkgrel=1
arch=('x86' 'x86_64')
makedepends=('git' 'cmake>=3.4.3')
depends=('leveldb')
provides=('cpp-ethereum')
conflicts=('cpp-ethereum')
url="https://github.com/ethereum/cpp-ethereum/"
license=('GPL3')

source=("git://github.com/ethereum/${_gitname}/#commit=d661ac4fec0aeffbedcdc195f67f5ded0c798278")

sha512sums=('SKIP')

prepare() {
	cd "${srcdir}/${_gitname}"
	git submodule update --init
}

build () {
	cd "${srcdir}/${_gitname}"
	rm -rf build
	mkdir -p build
	cd build/
	mkdir -p deps/lib64
	ln -s lib64 deps/lib

	cmake -DTESTS=OFF -DTOOLS=OFF ..
	cmake --build .
}

package () {
	cd "${srcdir}/${_gitname}"
	cd build/

	install -D aleth/aleth ${pkgdir}/usr/bin/aleth
}
