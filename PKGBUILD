# Maintainer: Xiaoxu Guo <ftiasch0@gmail.com>
# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=folly
pkgver=2021.03.22.00
pkgrel=1
pkgdesc="An open-source C++ library developed and used at Facebook"
arch=('x86_64')
url="https://github.com/facebook/folly"
license=('Apache')
depends=('snappy' 'jemalloc' 'double-conversion' 'gflags' 'google-glog' 'libevent' 'boost>=1.51.0'
         'boost-libs' 'fmt' 'openssl' 'zlib' 'bzip2' 'xz' 'lz4' 'zstd' 'libsodium')
makedepends=('cmake' 'gtest' 'gmock')
source=("https://github.com/facebook/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('8615b9a614aa9df0e64115dae69c59e6dff27a25ab5d193cb518c11ff785c3f2')

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
