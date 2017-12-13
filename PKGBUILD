# Maintainer: 0x47

gitname=cpp-ethereum
pkgname=('cpp-ethereum-git')
pkgdesc="Ethereum C++ client"
pkgver=r31888.04e8ca5af
pkgrel=1
arch=('any')
makedepends=('git' 'cmake>=3.4.3')
depends=('leveldb')
provides=('cpp-ethereum')
conflicts=('cpp-ethereum')
url="https://github.com/ethereum/cpp-ethereum/"
license=('GPL3')

source=("git://github.com/ethereum/${gitname}/")

sha512sums=('SKIP')

prepare() {
	cd "${srcdir}/${gitname}"
	git submodule update --init
}

pkgver() {
	cd "${gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd "${srcdir}/${gitname}"
	mkdir -p build
	cd build/

	cmake ..
	cmake --build .
}

package () {
	cd "${srcdir}/${gitname}"
	cd build/

	install -D usr/bin/eth ${pkgdir}/usr/bin/eth
}

