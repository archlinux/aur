# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wdt
pkgver=1.27.1612021
pkgrel=7
pkgdesc="Tool to transfer data between 2 systems as fast as possible over multiple TCP paths"
arch=('i686' 'x86_64')
url="https://github.com/facebook/wdt"
license=('BSD')
depends=('glibc' 'bash' 'double-conversion' 'gflags' 'google-glog' 'openssl-1.0')
makedepends=('git' 'cmake' 'boost')
optdepends=('jemalloc')
checkdepends=('gtest')
source=("git+https://github.com/facebook/wdt.git#tag=v$pkgver"
        "git+https://github.com/facebook/folly.git#tag=v2017.04.10.00")
sha256sums=('SKIP'
            'SKIP')


build() {
  cd "wdt"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DOPENSSL_INCLUDE_DIR="/usr/include/openssl-1.0" \
    -DOPENSSL_SSL_LIBRARY="/usr/lib/openssl-1.0/libssl.so" \
    -DOPENSSL_CRYPTO_LIBRARY="/usr/lib/openssl-1.0/libcrypto.so" \
    ./
    # -DBUILD_TESTING=on
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
