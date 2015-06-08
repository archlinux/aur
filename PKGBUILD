# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=engauge  
pkgver=5.2
pkgrel=1
pkgdesc="A Digitizer for curves and scanned plots"
url="http://digitizer.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt4' 'fftw')
source=("http://downloads.sourceforge.net/project/digitizer/Engauge%20Digitizer/digitizer-$pkgver/${pkgname}_${pkgver}.tgz" "$pkgname.desktop")
md5sums=('2fbd9c81fa9e910f871560767bbb52bc'
         '53def24f20c3d0178d3cf1b8c574fe15')
install=engauge.install

build() {
  cd $srcdir/$pkgname-$pkgver
  qmake-qt4 digitizer.pro
  make 
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 bin/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 usermanual/animation.png \
    $pkgdir/usr/share/icons/$pkgname.png 
  install -d $pkgdir/usr/share/doc/$pkgname
  cp -r samples $pkgdir/usr/share/doc/$pkgname
  cp -r usermanual $pkgdir/usr/share/doc/$pkgname
  install -Dm644 $srcdir/$pkgname.desktop \
    $pkgdir/usr/share/applications/$pkgname.desktop
}
