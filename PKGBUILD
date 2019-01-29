# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-lib
pkgver=4.0.0
pkgrel=1
pkgdesc="Library providing the Kiwix software core"
license=('GPL3')
arch=('any')
depends=('libzim>=4.0.0' 'pugixml' 'mustache' 'xapian-core' 'libaria2')
makedepends=('meson')
url='https://github.com/kiwix/kiwix-lib'
source=("https://github.com/kiwix/kiwix-lib/archive/${pkgver}.tar.gz")
sha256sums=(bd61d9bbe68322a86605b2f9cddd0d45bb2e814be0b73fe3df40ada91bf4c066)

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
