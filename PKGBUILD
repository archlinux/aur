# Maintainer: nth233 <fpg2012@yeah.net>

pkgname=scalculator
pkgver=2.0
pkgrel=2
pkgdesc="Simple but full-fledged calculator"
arch=('x86_64')
url='https://github.com/fpg2012/scalculator'
license=('LGPL3')
depends=('gmp>=6.2.1-1' 'mpfr>=4.1.0.p13-1' 'qt5-base>=5.15.2' 'glibc>=2.33-5')
makedepends=('flex>=2.6.4-3' 'bison>=3.8.1-1' 'cmake>=3.21.3-1' 'gcc>=11.1.0-1')
source=("scalculator.tar.gz::https://github.com/fpg2012/scalculator/archive/refs/tags/v2.0.tar.gz" "sevaluator.tar.gz::https://github.com/fpg2012/sevaluator/archive/refs/tags/v2.1.tar.gz")
sha256sums=('465cfc9296e297f77d3b1fd2032480fc95bc2aba55b8f1ec9cf0ecd4668d0697'
            '42cacca41efabde44010250763ac666539ddef560230aa5a2e0ae227ae0cf2c5')
provides=('scalculator')

build() {
	tar xf scalculator.tar.gz
	tar xf sevaluator.tar.gz
	mv sevaluator-2.1/* -t scalculator-2.0/sevaluator/
	cd scalculator-2.0
	mkdir -p build
	cd build
	cmake ..
	make
}

package() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/applications
	mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps
	cd $srcdir/scalculator-2.0/build
	install scalculator $pkgdir/usr/bin/
	cd ../misc
	install scalculator.desktop  $pkgdir/usr/share/applications/
	install scalculator.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/
}
