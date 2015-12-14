# Maintainer: SanskritFritz (gmail)

pkgname=bubble-chains
#_pkgname=chains
pkgver=0.1.1
pkgrel=6
pkgdesc="A 2d arcade-puzzle game. The aim is to collect chains of same-color bubbles, and to destroy all the target items."
arch=('i686' 'x86_64')
url="http://bubble-chains.sintegrial.com/"
license=('GPL3')
depends=('qt4' 'sdl_mixer')
optdepends=('timidity++: for enabling music')
#source=(http://bubble-chains.sintegrial.com/get.php?file=chains_src ${_pkgname}.desktop ${_pkgname}.png)
source=("https://github.com/SanskritFritz/bubble-chains/archive/$pkgver.tar.gz"
        "${pkgname}.desktop" "${pkgname}.png")

md5sums=('de0634b065af5c133d57b8bcb899308b'
         '92120c053e98627a4626ff85c5cac054'
         '49fba66c11014e8da4980876e90ad4b6')

build() {
	cd $pkgname-$pkgver
	sed -i -e 's#/usr/local/bin#/usr/bin#g' \
		-e 's#/usr/local/games#/usr/share#g'\
		-e 's#LIBS += -lSDLmain#LIBS += -lSDL -lX11#' \
		Game.pro main.cpp
	qmake-qt4 
	make
}
package() {
	cd $pkgname-$pkgver
	make INSTALL_ROOT=${pkgdir} install
	chmod -R 755 $pkgdir/usr/share/chains
	install -Dm644 $startdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
	install -Dm644 $startdir/${pkgname}.png $pkgdir/usr/share/pixmaps/${pkgname}.png
}
