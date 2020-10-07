# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=expat-git
pkgver=2.2.10.r5.g0d9b0812
pkgrel=1
pkgdesc="A stream-oriented XML parser library written in C"
arch=('i686' 'x86_64')
url="https://libexpat.github.io/"
license=('custom')
depends=('glibc')
makedepends=('git' 'cmake')
provides=('expat')
conflicts=('expat')
source=("git+https://github.com/libexpat/libexpat.git")
sha256sums=('SKIP')


pkgver() {
  cd "libexpat/expat"

  git describe --long --tags | sed 's/^R_//;s/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

build() {
  cd "libexpat/expat"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    ./
  make -C "_build"
}

check() {
  cd "libexpat/expat"

  make -C "_build" test
}

package() {
  cd "libexpat/expat"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/expat"
}
