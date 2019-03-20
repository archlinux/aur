# Maintainer: hashworks <mail@hashworks.net>
pkgname=libzim
pkgver=4.0.6
pkgrel=1
pkgdesc="Reference implementation of the ZIM specification by the openZIM project"
license=('GPL2')
arch=('any')
replaces=('zimlib-git')
depends=('xapian-core' 'zlib' 'xz' 'icu')
makedepends=('meson' 'gtest')
url='https://github.com/openzim/libzim'
source=("https://github.com/openzim/libzim/archive/${pkgver}.tar.gz")
sha256sums=(c0e29491ec56a3d3d39067786ee9604c7fc73e3514709e26c8ea34abc9f6a102)

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
