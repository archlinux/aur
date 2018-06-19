# Maintainer: hashworks <mail@hashworks.net>
pkgname=libzim
pkgver=4.0.0
pkgrel=1
pkgdesc="Reference implementation of the ZIM specification by the openZIM project"
license=('GPL2')
arch=('any')
replaces=('zimlib-git')
depends=('zlib' 'xz' 'icu')
makedepends=('meson' 'gtest')
url='https://github.com/openzim/libzim'
source=("https://github.com/openzim/libzim/archive/${pkgver}.tar.gz")
sha256sums=(e195d30ba1b55dd2b6529fdd84fcbed6ec35ed4ddc957ad7725edabd20c3126c)

build() {
	cd "${pkgname}-${pkgver}"
	# werror=false is required until https://github.com/openzim/libzim/issues/154 is resolved
	arch-meson build -Dwerror=false
	ninja -C build
}

check() {
	cd "${pkgname}-${pkgver}/build"
	ninja meson-test
}

package() {
	cd "${pkgname}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install
}
