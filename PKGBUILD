# Maintainer: hashworks <mail@hashworks.net>
pkgname=libzim
pkgver=5.0.0
pkgrel=1
pkgdesc="Reference implementation of the ZIM specification by the openZIM project"
license=('GPL2')
arch=('any')
replaces=('zimlib-git')
depends=('xapian-core' 'zlib' 'xz' 'icu')
makedepends=('meson' 'gtest')
url='https://github.com/openzim/libzim'
source=("https://github.com/openzim/libzim/archive/${pkgver}.tar.gz")
sha256sums=(dbec0a36155315037a6496a9be5c7ede17171fcde47063c97ce937057b437fdb)

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
