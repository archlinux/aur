# Maintainer: nth233 <fpg2012@yeah.net>

pkgname=scalculator
pkgver=2.1
pkgrel=1
pkgdesc="Simple but full-fledged calculator"
arch=('x86_64')
url='https://github.com/fpg2012/scalculator'
license=('LGPL3')
depends=('gmp>=6.2.1-1' 'mpfr>=4.1.0.p13-1' 'qt5-base>=5.15.2' 'glibc>=2.33-5')
makedepends=('flex>=2.6.4-3' 'bison>=3.8.1-1' 'cmake>=3.21.3-1' 'gcc>=11.1.0-1')
source=("scalculator.tar.gz::https://github.com/fpg2012/scalculator/archive/refs/tags/v2.1.tar.gz" "sevaluator.tar.gz::https://github.com/fpg2012/sevaluator/archive/refs/tags/v2.1.tar.gz")
sha256sums=('8d37925b3a03ef366642057e2ac26245e75881497fef68d616f83dd15dede9dc'
            '42cacca41efabde44010250763ac666539ddef560230aa5a2e0ae227ae0cf2c5')
provides=('scalculator')

build() {
	tar xf scalculator.tar.gz
	tar xf sevaluator.tar.gz
	mv sevaluator-2.1/* -t scalculator-2.1/sevaluator/
	cd scalculator-2.1
	mkdir -p build
	cd build
	cmake ..
	make
}

package() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/applications
	mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps
	cd $srcdir/scalculator-2.1/build
	install scalculator $pkgdir/usr/bin/
	cd ../misc
	install scalculator.desktop  $pkgdir/usr/share/applications/
	install scalculator.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/
}
