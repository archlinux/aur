# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libburn-git
pkgver=1.5.4.r5.g892df64
pkgrel=1
pkgdesc="Library for reading, mastering and writing optical discs"
arch=('i686' 'x86_64')
url="https://dev.lovelyhq.com/libburnia/web/wiki/Libburn"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('libburn')
conflicts=('libburn')
options=('staticlibs')
source=("git+https://dev.lovelyhq.com/libburnia/libburn.git")
sha256sums=('SKIP')


pkgver() {
  cd "libburn"

  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libburn"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libburn"

  make check
}

package() {
  cd "libburn"

  make DESTDIR="$pkgdir" install
}
