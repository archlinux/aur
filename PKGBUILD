# Maintainer: Joe Neeman <joeneeman@gmail.com>
# Contributor: Rémy Oudompheng <oudomphe@clipper.ens.fr>
# Contributor: Alessandro "jakedust" Andrioni <jakedust@gmail.com>
pkgname=mpir
pkgver=2.7.0_beta1
_version=2.7.0
_extraver=-beta1
pkgrel=1
pkgdesc="Library for multiple precision integers and rationals"
arch=('i686' 'x86_64')
url="http://www.mpir.org/"
license=('LGPL')
depends=('gcc-libs')
source=(http://www.mpir.org/mpir-$_version$_extraver.tar.lz)
md5sums=('411f59695ee88e87c405d13358c19201')
install=mpir.install

build() {
  cd "$srcdir/mpir-$_version"
  [[ "$CARCH" == "i686" ]] && export ABI=32
  ./configure --prefix=/usr --enable-cxx 
  make
}

check() {
  cd "$srcdir/mpir-$_version"
  make check
}

package() {
  cd "$srcdir/mpir-$_version"
  make DESTDIR="$pkgdir" install
}

