# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mpfr-git
pkgver=r13607.gec77070d4
pkgrel=1
pkgdesc="C library for multiple-precision floating-point computations with correct rounding"
arch=('i686' 'x86_64')
url="https://www.mpfr.org/"
license=('GPL3' 'LGPL3')
depends=('glibc' 'gmp')
makedepends=('git')
provides=('mpfr')
conflicts=('mpfr')
options=('staticlibs')
source=("git+https://gitlab.inria.fr/mpfr/mpfr.git")
sha256sums=('SKIP')


pkgver() {
  cd "mpfr"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "mpfr"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --enable-thread-safe
  make
}

check() {
  cd "mpfr"

  make check
}

package() {
  cd "mpfr"

  make DESTDIR="$pkgdir" install
}
