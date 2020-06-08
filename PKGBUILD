# Maintainer: hashworks <mail@hashworks.net>
pkgname=libzim
pkgver=6.1.5
pkgrel=2
pkgdesc="Reference implementation of the ZIM specification by the openZIM project"
license=('GPL2')
arch=('armv7h' 'i686' 'x86_64')
depends=('xapian-core' 'zlib' 'xz' 'icu')
makedepends=('meson' 'gtest' 'cython' 'python-pytest')
url='https://github.com/openzim/libzim'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(c38127663c79a672204426491cf117b609957b4ce2ec69413e474b668a1b02f2)

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
	install -Dm644 "${pkgname}-${pkgver}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	cd "${pkgname}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install
}
