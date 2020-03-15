# Maintainer: Dan McCurry <dan.mc at protonmail dot com>
pkgname=profex
pkgver=4.0.3
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
source=("https://www.profex-xrd.org/wp-content/uploads/2020/01/${pkgname}-${pkgver}.tar.gz"
	"local://profex.desktop")
md5sums=('28a25a432565a93cd59d695cdf4d93a9'
         'd67ab02738497d00e200af6ee572d92b')

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
