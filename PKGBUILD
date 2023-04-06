# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=check-git
pkgver=0.15.2.r52.g455005d
pkgrel=1
pkgdesc="A unit testing framework for C"
arch=('i686' 'x86_64')
url="https://libcheck.github.io/check/"
license=('LGPL')
depends=('glibc' 'gawk')
makedepends=('git')
provides=("check=$pkgver")
conflicts=('check')
options=('staticlibs')
source=("git+https://github.com/libcheck/check.git")
sha256sums=('SKIP')


pkgver() {
  cd "check"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "check"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "check"

  #make check
}

package() {
  cd "check"

  make DESTDIR="$pkgdir" install
}
