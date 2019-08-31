# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=libxc3
_pkgname=libxc
pkgver=3.0.1
pkgrel=2
pkgdesc="library of exchange-correlation functionals for density-functional theory (version 3)"
arch=('i686' 'x86_64')
url="http://www.tddft.org/programs/octopus/wiki/index.php/Libxc"
license=('MPL2')
provides=(libxc)
conflicts=(libxc)
makedepends=('gcc' 'gcc-fortran')
optdepends=()
source=(https://gitlab.com/libxc/libxc/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=('4dd5d04db454687a21f49b0acd1c740d31dbc978bf97405c8f8ce9e7412ada1b')
options=(staticlibs)

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  autoreconf -i
  FCCPP='/usr/bin/cpp -P -ansi' ./configure --prefix=/usr --enable-shared
  make
}

package() {

  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

}
