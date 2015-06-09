# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname=idsk
pkgver=0.13
pkgrel=2
pkgdesc="A tool for managing Amstrad CPC DSK images"
arch=('i686' 'x86_64')
url="http://koaks.amstrad.free.fr/amstrad/projets/"
license=('unknown')
depends=()
install=$pkgname.install
makedepends=("addinclude")
source=("http://sid.cpc.free.fr/iDSK."$pkgver"-src.tgz")
md5sums=('b221623d3039e09b15c5a071caf343b8')

build() {
  cd "$srcdir/iDSK."$pkgver"/iDSK"
  for i in Basic.cpp BitmapCPC.cpp Dams.cpp Desass.cpp GestDsk.cpp Outils.cpp
  do
    addinclude src/$i stdio
  done
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/iDSK."$pkgver"/iDSK"
  make DESTDIR="$pkgdir" install
}

