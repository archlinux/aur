# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=xlnt-git
pkgver=20151104
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
	cmake -D SHARED=1 -D CMAKE_INSTALL_PREFIX:PATH=/usr ../cmake
	make
}

check() {
	cd "${srcdir}/xlnt"
	cd build
	cmake -D SHARED=1 -D CMAKE_INSTALL_PREFIX:PATH=/usr -D BUILD_TESTS=1 -D AUTORUN_TESTS=1  ../cmake
	make
}

package() {
	cd "${srcdir}/xlnt/build"
	make DESTDIR="${pkgdir}" install
}
