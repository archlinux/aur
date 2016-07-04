#Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
#Contributor: Bob Finch <w9ya@qrparci.net>

pkgname=qsstv
pkgver=9.1.7
pkgrel=1
pkgdesc="Radio Slow-Scan TV for qt"
url="http://users.telenet.be/on4qz/"
depends=('qt4' 'hamlib' 'fftw' 'openjpeg2')
source=(http://users.telenet.be/on4qz/qsstv/downloads/${pkgname}_${pkgver}.tar.gz
        $pkgname.desktop)
arch=('i686' 'x86_64')
license=('GPL')
sha512sums=('ff8e358af8715358c839715daa43ea86a107b762f47843f8d14887599e7035a6c3a1028be7e6ae72d56b04e2bbe7e3c0b29c44c67cce6dacd7e2c315bb92c76f'
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
