# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-lib
pkgver=5.0.0
pkgrel=1
pkgdesc="Library providing the Kiwix software core"
license=('GPL3')
arch=('any')
depends=('libzim>=4.0.7' 'pugixml' 'mustache' 'xapian-core' 'libaria2')
makedepends=('meson')
url='https://github.com/kiwix/kiwix-lib'
source=("https://github.com/kiwix/kiwix-lib/archive/${pkgver}.tar.gz")
sha256sums=(3f174c706db6380cf24252945b55aba0a483f112c9459e366595f19277013318)

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
