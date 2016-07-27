# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=xlnt-git
pkgver=v0.9.0.r182.g6707736
pkgrel=1
pkgdesc="user-friendly xlsx library for C++14"
url="https://github.com/tfussell/xlnt"
license=('MIT')
arch=('i686' 'x86_64')
depends=()
makedepends=()
source=("git://github.com/tfussell/xlnt.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/xlnt"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/xlnt"
	git submodule init
	git submodule update
}

build() {
	cd "${srcdir}/xlnt"
	cd build
	rm -f CMakeCache.txt
	cmake -D SHARED=1 -D CMAKE_INSTALL_PREFIX:PATH=/usr -D DEBUG=1 -D TESTS=1 ../
	make
}

check() {
	cd "${srcdir}/xlnt"
	cd build
	./bin/xlnt.test
}

package() {
	cd "${srcdir}/xlnt/build"
	make DESTDIR="${pkgdir}" install
}

pkgver() {
	cd "${srcdir}/xlnt"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
