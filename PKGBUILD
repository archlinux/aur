# Maintainer: hashworks <mail@hashworks.net>
pkgname=libzim
pkgver=6.1.7
pkgrel=1
pkgdesc="Reference implementation of the ZIM specification by the openZIM project"
license=('GPL2')
arch=('armv7h' 'i686' 'x86_64')
depends=('xapian-core' 'zlib' 'xz' 'icu' 'zstd')
makedepends=('meson' 'gtest' 'cython' 'python-pytest')
url='https://github.com/openzim/libzim'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(5b1e6538718a5ef72450b43e7e08d44db8a8cc894988c0f130599d133d4a2d67)

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
