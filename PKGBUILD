# Maintainer: 0x47

_gitname=cpp-ethereum
pkgname=('cpp-ethereum-git')
pkgdesc="Ethereum C++ client"
pkgver=r31888.04e8ca5af
pkgrel=2
arch=('x86' 'x86_64')
makedepends=('git' 'cmake>=3.4.3')
depends=('leveldb')
provides=('cpp-ethereum')
conflicts=('cpp-ethereum')
url="https://github.com/ethereum/cpp-ethereum/"
license=('GPL3')

source=("git://github.com/ethereum/${_gitname}/")

sha512sums=('SKIP')

prepare() {
	cd "${srcdir}/${_gitname}"
	git submodule update --init
}

pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd "${srcdir}/${_gitname}"
	mkdir -p build
	cd build/

	cmake ..
	cmake --build .
}

package () {
	cd "${srcdir}/${_gitname}"
	cd build/

	install -D eth/eth ${pkgdir}/usr/bin/eth
}

