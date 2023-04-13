# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=yajl-git
pkgver=2.1.0.r5.g5e3a785
pkgrel=2
pkgdesc="A fast streaming JSON parsing library in C"
arch=('i686' 'x86_64')
url="https://lloyd.github.io/yajl/"
license=('ISC')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("yajl=$pkgver" 'libyajl.so')
conflicts=('yajl')
options=('staticlibs')
source=("git+https://github.com/lloyd/yajl.git")
sha256sums=('SKIP')


pkgver() {
  cd "yajl"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "yajl"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    ./
  make -C "_build"
}

check() {
  cd "yajl"

  make -C "_build" test test-api
}

package() {
  cd "yajl"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/yajl"
}
