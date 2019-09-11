# Maintainer: hashworks <mail@hashworks.net>
pkgname=libzim
pkgver=6.0.1
pkgrel=2
pkgdesc="Reference implementation of the ZIM specification by the openZIM project"
license=('GPL2')
arch=('armv7h' 'i686' 'x86_64')
replaces=('zimlib-git')
depends=('xapian-core' 'zlib' 'xz' 'icu')
makedepends=('meson' 'gtest' 'cython' 'python-pytest')
url='https://github.com/openzim/libzim'
source=("https://github.com/openzim/libzim/archive/${pkgver}.tar.gz")
sha256sums=(3e710de412e5a60ab07ef72dfae243147747ff531acc5cbed2cba7064bd0733b)

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
