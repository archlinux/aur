# Maintainer: Morteza NourelahiAlamdari <m at 0t1 dot me>

pkgname=google-cloud-cpp
pkgver=1.26.1
pkgrel=1
pkgdesc="C++ Client Libraries for Google Cloud Services"
arch=('i686' 'x86_64')
url="https://github.com/googleapis/google-cloud-cpp/"
license=('Apache-2.0')
makedepends=('gcc' 'cmake' 'm4')
depends=('protobuf' 'grpc' 'nlohmann-json' 'c-ares' 'zlib' 'openssl' 'curl' 'google-cloud-cpp-abseil-cpp' 'google-crc32c')
source=("$pkgname-$pkgver.tar.gz::https://github.com/googleapis/google-cloud-cpp/archive/v$pkgver.tar.gz")
md5sums=('9a35a0288a99d4421ca795d96c367c97')

build() {
  cd "$pkgname-$pkgver"
  cmake \
      -DBUILD_TESTING=OFF \
      -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/local" \
      -H. -Bcmake-out
  cmake --build cmake-out -- -j "${NCPU:-4}"
}

package() {
  cd "$pkgname-$pkgver"
  cmake --build cmake-out --target install 
}
