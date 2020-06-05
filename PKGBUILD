# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Daichi Shinozaki <dsdseg at gmail dot com>

pkgname=wangle
pkgver=2020.06.01.00
pkgrel=1
pkgdesc="C++ networking library providing client/server abstractions for building services"
arch=('x86_64')
url="https://github.com/facebook/wangle"
license=('Apache')
depends=('boost' 'boost-libs' 'google-glog' 'fizz' 'folly' 'libevent' 'openssl' 'fmt')
makedepends=('cmake' 'double-conversion' 'gflags' 'gtest' 'gmock')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9bbe4a74d062ecf64f97ac77d61d7dd4f649ca7d7dc647cba7bc886aeae90c39')

build() {
    cd "$pkgname-$pkgver/$pkgname"
    cmake -S . -B build \
          -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
          -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
          -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

check() {
    cd "$pkgname-$pkgver/$pkgname"
    cmake --build build --target test
}

package() {
    cd "$pkgname-$pkgver/$pkgname"
    cmake --build build --target install -- DESTDIR="$pkgdir/"
}
