# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=alglib-fpc
pkgver=2.6.0
pkgrel=1
pkgdesc="FreePascal version of ALGLIB, a numerical analysis and data processing library"
arch=('i686' 'x86_64')
url="http://www.alglib.net/"
license=('GPL')
depends=(fpc)
options=(!strip)
source=("http://www.alglib.net/translator/re/alglib-$pkgver.freepascal.zip"
        comments.patch)
md5sums=('204a2fd5d8fd9a5d6ba3cb190615e667'
         '5ec1c728d1aeec7d6b7b4babb65f5584')

build() {
  cd "$srcdir/freepascal/src"
  patch -p0 < ../../comments.patch
  for file in `ls *.pas`
  do
    fpc $file
  done
}

package(){
  cd "$srcdir/freepascal/src"
  _target="$pkgdir/usr/lib/fpc/`fpc -iV`/units/`fpc -iSP`-`fpc -iSO`/alglib"
  install -d -m755 "$_target"
  install -D -m644 {*.o,*.ppu} "$_target"/
}

