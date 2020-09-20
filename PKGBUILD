# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libmpc-git
pkgver=1.2.0.r11.g7afb2a7
pkgrel=1
pkgdesc="C library for the arithmetic of complex numbers"
arch=('i686' 'x86_64')
url="http://www.multiprecision.org/mpc/"
license=('LGPL')
depends=('glibc' 'mpfr')
makedepends=('git')
provides=('libmpc')
conflicts=('libmpc')
options=('staticlibs')
source=("git+https://gitlab.inria.fr/mpc/mpc.git")
sha256sums=('SKIP')


pkgver() {
  cd "mpc"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "mpc"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "mpc"

  make check
}

package() {
  cd "mpc"

  make DESTDIR="$pkgdir" install

  mv "$pkgdir/usr/share/info"/{mpc,libmpc}.info
}
