#Maintainer: Alexander Fasching <fasching.a91@gmail.com>
#Contributor: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
#Contributor: Bob Finch <w9ya@qrparci.net>

pkgname=qsstv
pkgver=9.5.5
_pkgver=9.5.5
pkgrel=1
pkgdesc="Radio Slow-Scan TV for qt"
url="http://users.telenet.be/on4qz/"
depends=('qt5-base' 'libpulse' 'v4l-utils' 'hamlib' 'fftw' 'openjpeg2' 'alsa-lib')
source=(http://users.telenet.be/on4qz/qsstv/downloads/${pkgname}_${pkgver}.tar.gz
        $pkgname.desktop)

arch=('i686' 'x86_64')
license=('GPL')
sha512sums=('04d66b28ae7f987b823bb150c399d36bd0eb9433d44a23d22436b0a40f451c7985ecf452003224e292da86130904b1153a37d683b9b6f2b0d46e67c7b2802129'
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
