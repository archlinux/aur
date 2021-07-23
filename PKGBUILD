#Maintainer: Alexander Fasching <fasching.a91@gmail.com>
#Contributor: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
#Contributor: Bob Finch <w9ya@qrparci.net>

pkgname=qsstv
pkgver=9.5.6
_pkgver=9.5.6
pkgrel=1
pkgdesc="Radio Slow-Scan TV for qt"
url="http://users.telenet.be/on4qz/"
depends=('qt5-base' 'libpulse' 'v4l-utils' 'hamlib' 'fftw' 'openjpeg2' 'alsa-lib')
source=(http://users.telenet.be/on4qz/qsstv/downloads/${pkgname}_${pkgver}.tar.gz
        $pkgname.desktop)

arch=('i686' 'x86_64')
license=('GPL')
sha512sums=('9df2dc6e30b91481d32ec80f312d14216099162584bedd57501e1f81987c3a01617d2f36af325a395d2b28323fec90e8813a84c350365af9f911ee354fe94039'
            '793be2e500824966d4288fff059fe5c869ec547ff5f4e32fbec02eeae1b12d6aa4e5ba34a9ce590bb166b73086291bfa3e0c2d76fb7c03187f656e8955acef4c')

build() {
  cd "$srcdir/${pkgname}"

  # trick qmake
  # qmake-qt5 PREFIX="$pkgdir/usr/"
  qmake-qt5 PREFIX=/usr/
  make $MAKEFLAGS
}

package() {
  cd "$srcdir/${pkgname}"
  mkdir -p "$pkgdir/usr/bin/"
  make INSTALL_ROOT="$pkgdir" install

  cd $srcdir
  install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D -m644 "$srcdir/${pkgname}/icons/${pkgname}.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
}
