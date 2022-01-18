# Maintainer: Xiaoxu Guo <ftiasch0@gmail.com>
# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=folly
pkgver=2022.01.17.00
pkgrel=1
pkgdesc="An open-source C++ library developed and used at Facebook"
arch=('x86_64')
url="https://github.com/facebook/folly"
license=('Apache')
depends=('snappy' 'jemalloc' 'double-conversion' 'gflags' 'google-glog' 'libevent' 'boost>=1.51.0'
         'boost-libs' 'fmt' 'openssl' 'zlib' 'bzip2' 'xz' 'lz4' 'zstd' 'libsodium'
         'libdwarf' 'libaio' 'liburing' 'libunwind')
makedepends=('cmake' 'gtest' 'gmock')
source=("https://github.com/facebook/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('22e774d9545764d8f83a1502c4b998e59f544fa5f9776c9c0389c4d51f0b87aa')

build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr -S . -B _build
  cmake --build _build
}

check() {
  cd "$pkgname-$pkgver"
  # cmake --build _build --target test
}

package() {
  cd "$pkgname-$pkgver"
  cmake --build _build --target install -- DESTDIR="$pkgdir/"
}
