# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libnl-tiny-git
pkgver=r43.gc0df580
pkgrel=2
pkgdesc="Tiny OpenWrt fork of libnl"
arch=('i686' 'x86_64')
url="https://git.openwrt.org/?p=project/libnl-tiny.git"
license=('LGPL-2.1-only')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("libnl-tiny=$pkgver")
conflicts=('libnl-tiny')
options=('staticlibs')
source=("git+https://git.openwrt.org/project/libnl-tiny.git")
sha256sums=('SKIP')


pkgver() {
  cd "libnl-tiny"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "libnl-tiny"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCMAKE_POLICY_VERSION_MINIMUM="3.5" \
    ./
  cmake --build "_build"
}

package() {
  cd "libnl-tiny"

  DESTDIR="$pkgdir" cmake --install "_build"
}
