#Maintainer: Alexander Fasching <fasching.a91@gmail.com>
#Contributor: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
#Contributor: Bob Finch <w9ya@qrparci.net>

pkgname=qsstv
pkgver=9.5.0
_pkgver=9.5
pkgrel=1
pkgdesc="Radio Slow-Scan TV for qt"
url="http://users.telenet.be/on4qz/"
depends=('qt5-base' 'libpulse' 'v4l-utils' 'hamlib' 'fftw' 'openjpeg2' 'alsa-lib')
source=(http://users.telenet.be/on4qz/qsstv/downloads/${pkgname}_${pkgver}.tar.gz
        $pkgname.desktop)
arch=('i686' 'x86_64')
license=('GPL')
sha512sums=('a4640445eeb8d7bd8217cb65d2a4dfd18810ab2773d7ca364df7729914c99804fa922a2ce069f1b0444bda77fccf0608633c4cc2454fa9d398403f794ac0ef90'
            '793be2e500824966d4288fff059fe5c869ec547ff5f4e32fbec02eeae1b12d6aa4e5ba34a9ce590bb166b73086291bfa3e0c2d76fb7c03187f656e8955acef4c')

build() {
  cd "$srcdir/${pkgname}_$_pkgver"

  # trick qmake
  # qmake-qt5 PREFIX="$pkgdir/usr/"
  qmake-qt5 PREFIX=/usr/
  make $MAKEFLAGS
}

package() {
  cd "$srcdir/${pkgname}_$_pkgver"
  mkdir -p "$pkgdir/usr/bin/"
  make INSTALL_ROOT="$pkgdir" install

  cd $srcdir
  install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D -m644 "$srcdir/${pkgname}_$_pkgver/icons/${pkgname}.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
}
