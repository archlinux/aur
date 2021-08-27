# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libcerf-git
pkgver=1.17.r0.g4f2c638
pkgrel=1
pkgdesc="A self-contained numeric library"
arch=('i686' 'x86_64')
url="https://jugit.fz-juelich.de/mlz/libcerf/"
license=('custom')
depends=('glibc')
makedepends=('git' 'cmake')
provides=('libcerf')
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
  make -C "_build"
}

check() {
  cd "libcerf"

  make -C "_build" test
}

package() {
  cd "libcerf"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libcerf"
}
