# Maintainer: hashworks <mail@hashworks.net>
pkgname=libzim
pkgver=4.0.1
pkgrel=1
pkgdesc="Reference implementation of the ZIM specification by the openZIM project"
license=('GPL2')
arch=('any')
replaces=('zimlib-git')
depends=('zlib' 'xz' 'icu')
makedepends=('meson' 'gtest')
url='https://github.com/openzim/libzim'
source=("https://github.com/openzim/libzim/archive/${pkgver}.tar.gz")
sha256sums=(8e26cfea24a77cdc0ad7d51ad2df939130ad4c489f28c90fdc6ffc1b0da0a085)

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
