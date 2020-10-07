# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uci-git
pkgver=r511.g4c8b4d6
pkgrel=2
pkgdesc="OpenWrt unified configuration interface"
arch=('i686' 'x86_64')
url="https://openwrt.org/docs/techref/uci"
license=('LGPL')
depends=('glibc' 'libubox' 'lua')
makedepends=('git' 'cmake')
provides=('uci')
conflicts=('uci')
source=("git+https://git.openwrt.org/project/uci.git")
sha256sums=('SKIP')


pkgver() {
  cd "uci"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "uci"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

package() {
  cd "uci"

  make -C "_build" DESTDIR="$pkgdir" install
}
