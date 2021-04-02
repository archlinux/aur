# Maintainer: Joe Neeman <joeneeman@gmail.com>
# Contributor: Rémy Oudompheng <oudomphe@clipper.ens.fr>
# Contributor: Alessandro "jakedust" Andrioni <jakedust@gmail.com>
pkgname=mpir
pkgver=3.0.0
pkgrel=2
pkgdesc="Library for multiple precision integers and rationals"
arch=('i686' 'x86_64')
url="https://www.mpir.org/"
license=('LGPL')
depends=('gcc-libs')
makedepends=('yasm')
source=(https://www.mpir.org/mpir-$pkgver.tar.bz2)
sha256sums=('52f63459cf3f9478859de29e00357f004050ead70b45913f2c2269d9708675bb')
install=mpir.install

prepare() {
  cd "$srcdir/mpir-$pkgver"
}

build() {
  cd "$srcdir/mpir-$pkgver"
  [[ "$CARCH" == "i686" ]] && export ABI=32
  ./configure --prefix=/usr --enable-cxx 
  make
}

check() {
  cd "$srcdir/mpir-$pkgver"
  make check
}

package() {
  cd "$srcdir/mpir-$pkgver"
  make DESTDIR="$pkgdir" install
}

