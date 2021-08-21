# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=googletest-git
pkgver=1.11.0.r45.g2f80c2ba
pkgrel=2
pkgdesc="Google's C++ test framework"
arch=('i686' 'x86_64')
url="https://google.github.io/googletest/"
license=('BSD')
depends=('gcc-libs' 'sh')
makedepends=('git' 'cmake')
provides=('gmock' 'gtest')
conflicts=('gmock' 'gtest')
source=("git+https://github.com/google/googletest.git")
sha256sums=('SKIP')


pkgver() {
  cd "googletest"

  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "googletest"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=ON \
    ./
  make -C "_build"
}

check() {
  cd "googletest"

  #make -C "_build" test
}

package() {
  cd "googletest"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/gtest"
}
