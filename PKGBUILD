# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-lib
pkgver=3.0.3
pkgrel=1
pkgdesc="Library providing the Kiwix software core"
license=('GPL3')
arch=('any')
depends=('libzim>=4.0.0' 'pugixml' 'ctpp2' 'xapian-core' 'libaria2')
makedepends=('meson')
url='https://github.com/kiwix/kiwix-lib'
source=("https://github.com/kiwix/kiwix-lib/archive/${pkgver}.tar.gz")
sha256sums=(33e369a96ab4cd6b1dba5d9997154ac27180de606204ccc5985eded8123d2fc2)

build() {
	cd "${pkgname}-${pkgver}"
	# We want to ignore xapian ABI version mismatches
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
