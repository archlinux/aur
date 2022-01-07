#Maintainer: Sam peters <dev at libertycloud dot de>
# Contributor: Dan McCurry <dan.mc at protonmail dot com>
pkgname=profex
pkgver=4.3.6
pkgrel=1
pkgdesc="A program for Rietveld refinement of powder X-ray diffraction data."
arch=('i686' 'x86_64')
url="http://profex.doebelin.org"
license=('GPL2')
groups=('science')
depends=(#'bgmn'
	'qt5-declarative'
	'qt5-svg')
provides=('profex')
conflicts=('profex')
source=("https://www.profex-xrd.org/wp-content/uploads/2021/12/${pkgname}-${pkgver}.tar.gz"
	'profex.desktop')
sha256sums=(
	'027e7136bc84393ce3abc6629754835d4d3dea6c53861ceccf9e71adcdaa19ae'
	'8d4e73987458eb9d1453c3bfe839a90ea1f5c15a0872ea5a35d0b532231d9194')
prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	qmake PREFIX=${pkgdir}/usr -r profex.pro
	make -j 4
}

package() {
	cd ${srcdir}
	install -Dm644 "${pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"
	
	cd "$pkgname-$pkgver"
	install -Dm644 "src/icons/${pkgname}.png" \
		"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	
	make install

	install -Dm755 "src/profex" "${pkgdir}/usr/bin/profex"
}
