# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libebur128-git
pkgver=1.2.6.r0.g67b33ab
pkgrel=2
pkgdesc="A library implementing the EBU R128 loudness standard"
arch=('i686' 'x86_64')
url="https://github.com/jiixyj/libebur128"
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("libebur128=$pkgver")
conflicts=('libebur128')
options=('staticlibs')
source=("git+https://github.com/jiixyj/libebur128.git")
sha256sums=('SKIP')


pkgver() {
  cd "libebur128"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libebur128"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

package() {
  cd "libebur128"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libebur128"
}
