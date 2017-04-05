# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: mcmillan <awmcmillan at gmail dot com>

pkgname=('engauge' 'engauge-samples')
pkgver=10.0
pkgrel=1
url="http://markummitchell.github.io/engauge-digitizer/"
arch=('i686' 'x86_64')
license=('GPL')
optdepends=('libpng12: For reading png image files'
     'libjpeg-turbo: For reading jpeg image files'
     'openjpeg: For reading jpeg2000 image files')
source=("$pkgname-$pkgver.tar.gz::https://github.com/markummitchell/$pkgname-digitizer/archive/v$pkgver.tar.gz" "$pkgname.desktop")
md5sums=('24ca9841ccefff0645c157e2fa72daa9'
         '53def24f20c3d0178d3cf1b8c574fe15')
install=engauge.install

build() {
  cd $srcdir/${pkgname}-digitizer-$pkgver
  qmake-qt5 engauge.pro
  make 
}

package_engauge() {
  pkgdesc="A Digitizer for curves and scanned plots"
  depends=('qt5-tools' 'fftw' 'log4cpp')
  cd $srcdir/${pkgname}-digitizer-$pkgver
  install -Dm755 bin/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 help/animation.png \
	  $pkgdir/usr/share/icons/$pkgname.png
  install -Dm644 $srcdir/$pkgname.desktop \
	  $pkgdir/usr/share/applications/$pkgname.desktop
}

package_engauge-samples() {
  pkgdesc="samples for engauge copied into the doc subdirectory"
  arch=('any')
  cd $srcdir/${pkgbase}-digitizer-$pkgver
  install -d $pkgdir/usr/share/doc/$pkgbase
  cp -r samples $pkgdir/usr/share/doc/$pkgbase
}
