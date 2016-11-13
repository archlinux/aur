# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: mcmillan <awmcmillan at gmail dot com>

pkgname=engauge
pkgver=9.5
pkgrel=2
pkgdesc="A Digitizer for curves and scanned plots"
url="http://markummitchell.github.io/engauge-digitizer/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt5-tools' 'fftw' 'log4cpp')
optdepends=('libpng12: For reading png image files'
     'libjpeg-turbo: For reading jpeg image files'
     'openjpeg: For reading jpeg2000 image files')
source=("$pkgname-$pkgver.tar.gz::https://github.com/markummitchell/$pkgname-digitizer/archive/v$pkgver.tar.gz" "$pkgname.desktop")
md5sums=('c45ee9b56796ba515901f9d9c05ecbc2'
         '53def24f20c3d0178d3cf1b8c574fe15')
install=engauge.install

build() {
  cd $srcdir/${pkgname}-digitizer-$pkgver
  qmake-qt5 engauge.pro
  make 
}

package() {
  cd $srcdir/${pkgname}-digitizer-$pkgver
  install -Dm755 bin/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 help/animation.png \
    $pkgdir/usr/share/icons/$pkgname.png 
  install -d $pkgdir/usr/share/doc/$pkgname
  cp -r samples $pkgdir/usr/share/doc/$pkgname
  cp -r help $pkgdir/usr/share/doc/$pkgname
  install -Dm644 $srcdir/$pkgname.desktop \
    $pkgdir/usr/share/applications/$pkgname.desktop
}
