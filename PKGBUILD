# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libcerf-git
pkgver=3.0.r0.gda4d8b3
pkgrel=1
pkgdesc="A self-contained numeric library"
arch=('i686' 'x86_64')
url="https://jugit.fz-juelich.de/mlz/libcerf/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("libcerf=$pkgver")
conflicts=('libcerf')
source=("git+https://jugit.fz-juelich.de/mlz/libcerf.git")
sha256sums=('SKIP')


pkgver() {
  cd "libcerf"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libcerf"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "libcerf"

  #cmake --build "_build" --target test
}

package() {
  cd "libcerf"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libcerf"
}
