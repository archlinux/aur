# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=google-cloud-cpp
pkgver=1.35.0
pkgrel=1
pkgdesc="C++ Client Libraries for Google Cloud Services"
arch=('i686' 'x86_64')
url="https://github.com/googleapis/google-cloud-cpp/"
license=('Apache-2.0')
makedepends=('gcc' 'cmake' 'm4')
depends=('protobuf' 'grpc' 'nlohmann-json' 'c-ares' 'zlib' 'openssl' 'curl' 'abseil-cpp' 'google-crc32c')
source=("$pkgname-$pkgver.tar.gz::https://github.com/googleapis/google-cloud-cpp/archive/v$pkgver.tar.gz")
sha256sums=('e4e9eac1e7999eff195db270bc2a719004660b3730ebb5d2f444f2d2057e49b2')

build() {
  cd "$pkgname-$pkgver"
  cmake \
      -DBUILD_TESTING=OFF \
      -DGOOGLE_CLOUD_CPP_ENABLE_EXAMPLES=OFF \
      -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/local" \
      -H. -Bcmake-out
  cmake --build cmake-out -- -j "$(nproc)"
}

package() {
  cd "$pkgname-$pkgver"
  cmake --build cmake-out --target install
}
