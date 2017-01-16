# Maintainer: Joe Neeman <joeneeman@gmail.com>
# Contributor: Rémy Oudompheng <oudomphe@clipper.ens.fr>
# Contributor: Alessandro "jakedust" Andrioni <jakedust@gmail.com>
pkgname=mpir
pkgver=2.7.2
pkgrel=2
pkgdesc="Library for multiple precision integers and rationals"
arch=('i686' 'x86_64')
url="http://www.mpir.org/"
license=('LGPL')
depends=('gcc-libs')
source=(http://www.mpir.org/mpir-$pkgver.tar.lz sed-syntax.patch)
md5sums=('2d47419dac50cc4a89c8c23421e66db1'
         'df95671f0781b2494ac7330cb9d18a2f')
install=mpir.install

prepare() {
  cd "$srcdir/mpir-$pkgver"
  patch -Np1 -i "${srcdir}/sed-syntax.patch"
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

