# Maintainer: hashworks <mail@hashworks.net>
pkgname=libzim
pkgver=6.1.3
pkgrel=1
pkgdesc="Reference implementation of the ZIM specification by the openZIM project"
license=('GPL2')
arch=('armv7h' 'i686' 'x86_64')
replaces=('zimlib-git')
depends=('xapian-core' 'zlib' 'xz' 'icu')
makedepends=('meson' 'gtest' 'cython' 'python-pytest')
url='https://github.com/openzim/libzim'
source=("https://github.com/openzim/libzim/archive/${pkgver}.tar.gz")
sha256sums=(629b7e4fb9d1dc75e755467362889688b4515d2c7982925c93bb974d04e033f3)

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
