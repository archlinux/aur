# Maintainer: hashworks <mail@hashworks.net>
pkgname=libzim
pkgver=4.0.4
pkgrel=3
pkgdesc="Reference implementation of the ZIM specification by the openZIM project"
license=('GPL2')
arch=('any')
replaces=('zimlib-git')
depends=('zlib' 'xz' 'icu')
makedepends=('meson' 'gtest')
url='https://github.com/openzim/libzim'
source=("https://github.com/openzim/libzim/archive/${pkgver}.tar.gz")
sha256sums=(8f56a16d15e810150d3c3ee9acce3606f676c90b72936e11f77f2a2548cd4611)

build() {
	cd "${pkgname}-${pkgver}"
	arch-meson build
	ninja -C build
}

check() {
	cd "${pkgname}-${pkgver}/build"
	SKIP_BIG_MEMORY_TEST=1 ninja meson-test
}

package() {
	cd "${pkgname}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install
}
