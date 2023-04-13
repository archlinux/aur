# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wdt-git
pkgver=1.27.1612021.r190.g6a122f2
pkgrel=1
pkgdesc="Tool to transfer data between 2 systems as fast as possible over multiple TCP paths"
arch=('i686' 'x86_64')
url="https://github.com/facebook/wdt"
license=('BSD')
depends=('glibc' 'bash' 'double-conversion' 'gflags' 'google-glog' 'openssl')
makedepends=('git' 'cmake' 'boost')
optdepends=('jemalloc')
checkdepends=('gtest')
provides=("wdt=$pkgver")
conflicts=('wdt')
source=("git+https://github.com/facebook/wdt.git"
        "git+https://github.com/facebook/folly.git")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "wdt"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "wdt"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr"
  make -C "_build"
}

check() {
  cd "wdt"

  #CTEST_OUTPUT_ON_FAILURE=1 make -C "_build" test
}

package() {
  cd "wdt"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/wdt"
}
