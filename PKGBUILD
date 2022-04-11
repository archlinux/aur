#Maintainer: Sam peters <dev at libertycloud dot de>
# Contributor: Dan McCurry <dan.mc at protonmail dot com>
pkgname=profex
pkgver=5.0.1
pkgrel=4
year=2022
month=03
pkgdesc="A program for Rietveld refinement of powder X-ray diffraction data."
arch=('i686' 'x86_64')
url="https://profex.doebelin.org"
license=('GPL2')
groups=('science')
depends=('qt6-5compat'
	'qt6-declarative'
	'qt6-svg')
optdepends=('bgmn: the needed backend for the program, not required to build or start the program')
provides=('profex')
conflicts=('profex')
source=("https://www.profex-xrd.org/wp-content/uploads/${year}/${month}/${pkgname}-${pkgver}.tar.gz"
	'profex.desktop')
sha256sums=('333d77a4b8690183bf43df1776fa4976c330f09af4799c0360bc694e47cf0c7a'
'8d4e73987458eb9d1453c3bfe839a90ea1f5c15a0872ea5a35d0b532231d9194')
makeprepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	qmake6 PREFIX=${pkgdir}/usr -r profex.pro
	make -j 8
}

package() {
	cd ${srcdir}
	install -Dm644 "${pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"
	
	cd "$pkgname-$pkgver"
	install -Dm644 "profex/icons/${pkgname}5.png" \
		"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	
	make install
	
  mkdir -p "${pkgdir}/usr/bin"
	install -Dm755 ${srcdir}/${pkgname}-${pkgver}/bin/* "${pkgdir}/usr/bin/"

}
