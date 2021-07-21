#Maintainer: Alexander Fasching <fasching.a91@gmail.com>
#Contributor: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
#Contributor: Bob Finch <w9ya@qrparci.net>

pkgname=qsstv
pkgver=9.5.4
_pkgver=9.5.4
pkgrel=2
pkgdesc="Radio Slow-Scan TV for qt"
url="http://users.telenet.be/on4qz/"
depends=('qt5-base' 'libpulse' 'v4l-utils' 'hamlib' 'fftw' 'openjpeg2' 'alsa-lib')
source=(http://users.telenet.be/on4qz/qsstv/downloads/${pkgname}_${pkgver}.tar.gz
        $pkgname.desktop)

arch=('i686' 'x86_64')
license=('GPL')
sha512sums=('ff6e8053dfe650df3612b05fbd0f75770397ce5584a7dde3ae7d8c7433487c8c11fe5e55dc97e3107427ea14e174c750f5c7b1103d3d59242513f8b07f0a0eb9'
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
