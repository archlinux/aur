# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mpfr-svn
pkgver=r13491
pkgrel=1
pkgdesc="C library for multiple-precision floating-point computations with correct rounding"
arch=('i686' 'x86_64')
url="https://www.mpfr.org/"
license=('GPL3' 'LGPL3')
depends=('glibc' 'gmp')
makedepends=('subversion')
provides=('mpfr')
conflicts=('mpfr')
options=('staticlibs')
source=("svn+https://scm.gforge.inria.fr/anonscm/svn/mpfr/trunk")
sha256sums=('SKIP')


pkgver() {
  cd "trunk"

  _ver="$(svnversion)"
  printf "r%s" "${_ver//[[:alpha:]]}"
}

build() {
  cd "trunk"

  ./autogen.sh || true
  automake -a
  ./configure \
    --prefix="/usr" \
    --enable-thread-safe
  make
}

check() {
  cd "trunk"

  make check
}

package() {
  cd "trunk"

  make DESTDIR="$pkgdir" install
}
