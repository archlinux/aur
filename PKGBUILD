#Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
#Contributor: Bob Finch <w9ya@qrparci.net>

pkgname=qsstv
pkgver=9.4.2
pkgrel=1
pkgdesc="Radio Slow-Scan TV for qt"
url="http://users.telenet.be/on4qz/"
depends=('qt5-base' 'libpulse' 'v4l-utils' 'hamlib' 'fftw' 'openjpeg2')
source=(http://users.telenet.be/on4qz/qsstv/downloads/${pkgname}_${pkgver}.tar.gz
        $pkgname.desktop)
arch=('i686' 'x86_64')
license=('GPL')
sha512sums=('e7e5fe925dd925fef4e2fcff15b33634aa0ea1f50ca01db2c2dcdd428b4c4c1f45cf5aaa9ad2c3b9374c588bb6f65bf99924537012ecf2065a03b3f4d1c46db9'
            '793be2e500824966d4288fff059fe5c869ec547ff5f4e32fbec02eeae1b12d6aa4e5ba34a9ce590bb166b73086291bfa3e0c2d76fb7c03187f656e8955acef4c')

build() {
  cd "$srcdir/${pkgname}_$pkgver"

  # trick qmake
#  qmake-qt5 PREFIX="$pkgdir/usr/"
  qmake-qt5
  make $MAKEFLAGS
}

package() {
  cd "$srcdir/${pkgname}_$pkgver"
  mkdir -p "$pkgdir/usr/bin/"
  make INSTALL_ROOT="$pkgdir" install

  cd $srcdir
  install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D -m644 "$srcdir/${pkgname}_$pkgver/qsstv/icons/${pkgname}.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
}
