# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=mbpoll-git
pkgver=v1.4.11.r14.g1968de6
pkgrel=2
pkgdesc="CLI for talking to Modbus devices, similar to modpoll"
url="https://github.com/epsilonrt/mbpoll"
license=('GPL-3.0')
arch=('i686' 'x86_64')
depends=(libmodbus)
makedepends=(cmake)
options=()
source=("git+https://github.com/epsilonrt/mbpoll")
md5sums=('SKIP')

build() {
	cd "${srcdir}/mbpoll"
	mkdir -p build
	cd build
	rm -f CMakeCache.txt
	cmake -D CMAKE_INSTALL_PREFIX:PATH=/usr ../
	make
}

package() {
	cd "${srcdir}/mbpoll/build"
	make DESTDIR="${pkgdir}" install
}

pkgver() {
	cd "${srcdir}/mbpoll"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
