#Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
#Contributor: Bob Finch <w9ya@qrparci.net>

pkgname=qsstv
pkgver=9.2.6
pkgrel=3
pkgdesc="Radio Slow-Scan TV for qt"
url="http://users.telenet.be/on4qz/"
depends=('qt5-base' 'libpulse' 'v4l-utils' 'hamlib' 'fftw' 'openjpeg2')
source=(http://users.telenet.be/on4qz/qsstv/downloads/${pkgname}_${pkgver}.tar.gz
        $pkgname.desktop)
arch=('i686' 'x86_64')
license=('GPL')
sha512sums=('10ad86db8a4db432dc757314375487d4128a612a54496105c2acaadce4f2cba8d044f1c5bf1d38534664ef7c065742606027306b3542ae834673ffce58885557'
            '793be2e500824966d4288fff059fe5c869ec547ff5f4e32fbec02eeae1b12d6aa4e5ba34a9ce590bb166b73086291bfa3e0c2d76fb7c03187f656e8955acef4c')

build() {
  cd "$srcdir/${pkgname}_$pkgver"

  # trick qmake
  qmake-qt5 PREFIX="$pkgdir/usr/"
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
