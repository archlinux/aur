#Maintainer: Mark Riedesel <mark@klowner.com>

pkgname=easy_profiler
pkgver=2.0.1
pkgrel=1
pkgdesc='Lightweight cross-platform profiler library for c++'
arch=('x86_64' 'i686' 'arm')
url='https://github.com/yse/easy_profiler'
license=('MIT')
makedepends=('cmake')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/yse/${pkgname}/archive/v${pkgver}.tar.gz"
	cmake-destination.patch
)

prepare() {
	cd ${pkgname}-${pkgver}
	patch -Np1 -i "${srcdir}/cmake-destination.patch"
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	mkdir -p build
	cd build
	cmake .. \
		-DCMAKE_BUILD_TYPE="Release" \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/build
	make DESTDIR=${pkgdir} install
}

md5sums=('f5d17cd937ba39d3b2584b003a71e6a7'
         '2e3f68c068787b71c2746b237550036d')
