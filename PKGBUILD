# Maintainer: Pio <xpio at tut dot by>

pkgname=exploding_numbers
pkgver=0.993
pkgrel=1
pkgdesc="A puzzle game with dividing and adding numbers in a 2D grid"
arch=('any')
url="http://advokat011.com/games/exploding_numbers"
license=('GPL-3.0-or-later')
depends=('love>=11' 'love<12')
makedepends=('unzip')
source=($pkgname.sh
	$pkgname.desktop
	$url/$pkgname-$pkgver.love)
sha256sums=('ed08ce09182aa95031b5b69a4fd02d25d32a9853b837a116723d7b40b9b435ab'
            'cd0385c25678cba45b55e5bf65e79579aa8728e260ec96644bc80618c66f12e0'
            '90102bebc308fcdffa742ada5b0fc1e30b3140d3a7227222ce69991d5ffc8126')
noextract=($pkgname-$pkgver.love)

prepare() {
	cd ${srcdir}
	unzip -o ${pkgname}-${pkgver}.love icon.png
}

package() {
	# Data
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}.love" "${pkgdir}/usr/share/${pkgname}/${pkgname}.love"
	# Launcher
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	# Desktop
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
