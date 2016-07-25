#Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
#Contributor: Bob Finch <w9ya@qrparci.net>

pkgname=qsstv
pkgver=9.1.8
pkgrel=1
pkgdesc="Radio Slow-Scan TV for qt"
url="http://users.telenet.be/on4qz/"
depends=('qt4' 'hamlib' 'fftw' 'openjpeg2')
source=(http://users.telenet.be/on4qz/qsstv/downloads/${pkgname}_${pkgver}.tar.gz
        $pkgname.desktop)
arch=('i686' 'x86_64')
license=('GPL')
sha512sums=('861f412faae4ecf7ec65327d48cfa0690ca3c8c80e611387c649941876478a25f1fc573b28d67c429942938e90fe9d8972016fc7d9719268c5a019aa5b87c0c4'
            '99aa49c0e03c03ec645196354c809016fbcdf6106aea8d79b4ed9e90f0d1127eabbc08a6bd20b3c4f66866aa3ffcc35beaf16cd6a926c9996f3ec431bb8759e8')

build() {
  
  cd $srcdir/${pkgname}_$pkgver

  # trick qmake
  qmake-qt4 PREFIX=$pkgdir/usr/
  make $MAKEFLAGS
}

package() {
  cd $srcdir/${pkgname}_$pkgver
  mkdir -p $pkgdir/usr/bin/
  make INSTALL_ROOT=$pkgdir install

  cd $srcdir
  install -D -m644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 $srcdir/${pkgname}_$pkgver/qsstv/icons/${pkgname}.png $pkgdir/usr/share/pixmaps/${pkgname}.png
}
