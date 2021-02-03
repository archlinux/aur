# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>

pkgname=libubox
pkgver=r486.g5bc0146
pkgrel=1
pkgdesc="C utility functions for OpenWrt"
arch=('i686' 'x86_64')
url="https://openwrt.org/docs/techref/libubox"
license=('ISC')
depends=('glibc' 'json-c')
makedepends=('git' 'cmake' 'lua')
options=('staticlibs')
source=("git+https://git.openwrt.org/project/libubox.git")
sha256sums=('SKIP')


pkgver() {
  cd "libubox"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "libubox"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

package() {
  cd "libubox"

  make -C "_build" DESTDIR="$pkgdir" install
}
