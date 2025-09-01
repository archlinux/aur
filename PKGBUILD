# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libbsd-git
pkgver=0.12.2.r4.g22fddb1
pkgrel=1
pkgdesc="Provides useful functions commonly found on BSD systems"
arch=('i686' 'x86_64')
url="https://libbsd.freedesktop.org/wiki/"
license=('BSD-3-Clause')
depends=('glibc' 'libmd')
makedepends=('git')
provides=("libbsd=$pkgver")
conflicts=('libbsd')
options=('staticlibs')
source=("git+https://gitlab.freedesktop.org/libbsd/libbsd.git")
sha256sums=('SKIP')


pkgver() {
  cd "libbsd"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libbsd"

  ./autogen
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libbsd"

  #make check
}

package() {
  cd "libbsd"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libbsd"
}
