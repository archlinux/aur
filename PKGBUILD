# Maintainer: Dominik Heidler <dheidler@gmail.com>

pkgname=afutrainer
pkgver=3.0
pkgrel=2
pkgdesc="ham radio test trainer"
arch=('x86_64' 'i686')
url="http://www.oliver-saal.de/software/afutrainer/"
license=('GPL')
groups=()
provides=()
depends=('qt4')
makedepends=('make' 'gcc')

noextract=("DL_Technik_Klasse_A_2007.aqz" "DL_Technik_Klasse_E_2007.aqz" "DL_Betriebstechnik_und_Vorschriften_2007.aqz")
source=(
	"http://www.oliver-saal.de/software/afutrainer/download/afutrainer-$pkgver-src.zip"
	"DL_Technik_Klasse_A_2007.aqz::http://www.oliver-saal.de/software/afutrainer/download/DL%20Technik%20Klasse%20A%202007.aqz"
	"DL_Technik_Klasse_E_2007.aqz::http://www.oliver-saal.de/software/afutrainer/download/DL%20Technik%20Klasse%20E%202007.aqz"
	"DL_Betriebstechnik_und_Vorschriften_2007.aqz::http://www.oliver-saal.de/software/afutrainer/download/DL%20Betriebstechnik%20und%20Vorschriften%202007.aqz"
)
md5sums=('a91f6cbadcac91e39ad7b2af1c0ce0e5'
         '93cdb5502297d895eab09e34162621ed'
         'fd421cf643f3d8118cec041023492eaa'
         'fbd0d697fa7f12aa4d902a602ca55026')

build() {
	cd "$srcdir/afutrainer-$pkgver-src"
	qmake-qt4
	make SUBLIBS=-lz
}

package() {
	cd "$srcdir"
	mkdir -p $pkgdir/usr/share/afutrainer
	install -m 644 *.aqz $pkgdir/usr/share/afutrainer
	cd "$srcdir/afutrainer-$pkgver-src"
	mkdir -p $pkgdir/usr/bin/
	install -m 755 ./afutrainer $pkgdir/usr/bin/afutrainer
} 
