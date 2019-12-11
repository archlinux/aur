#Maintainer: Mark Riedesel <mark@klowner.com>

pkgname=easy_profiler
pkgver=2.1.0
pkgrel=1
pkgdesc='Lightweight cross-platform profiler library for c++'
arch=('x86_64' 'i686' 'arm')
url='https://github.com/yse/easy_profiler'
license=('MIT')
makedepends=('cmake')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/yse/${pkgname}/archive/v${pkgver}.tar.gz"
	cmake-license-destination.patch
)

prepare() {
	cd ${pkgname}-${pkgver}
	patch -Np1 -i "${srcdir}/cmake-license-destination.patch"
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

md5sums=('11cf4ffdfcec905752aa820bea27648a'
         '2e1aac0c28163fca3d44dc9598e48112')
md5sums=('11cf4ffdfcec905752aa820bea27648a'
         '6f251eca4ba10416dfb70c639baac4d7')
