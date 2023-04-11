# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libisoburn-git
pkgver=1.5.4.r89.gd0ff0a38
pkgrel=1
pkgdesc="Frontend for libburn and libisofs"
arch=('i686' 'x86_64')
url="https://dev.lovelyhq.com/libburnia/web/wiki/Libisoburn"
license=('GPL')
depends=('glibc' 'libburn' 'libisofs' 'readline')
makedepends=('git')
optdepends=('tk: for xorriso-tcltk frontend'
            'sudo: for use with xorriso-dd-target')
provides=("libisoburn=$pkgver" 'xorriso' 'xorriso-tcltk')
conflicts=('libisoburn')
options=('staticlibs')
source=("git+https://dev.lovelyhq.com/libburnia/libisoburn.git")
sha256sums=('SKIP')


pkgver() {
  cd "libisoburn"

  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libisoburn"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libisoburn"

  make check
}

package() {
  cd "libisoburn"

  make DESTDIR="$pkgdir" install
}
