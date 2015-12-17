# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>
pkgname=cpprestsdk
pkgver=2.7.0
pkgrel=1
pkgdesc="a cross-platform, modern, and asynchronous library that enables developers to access and author connected applications"
arch=('i686' 'x86_64')
url="https://github.com/Microsoft/cpprestsdk/"
license=('Apache')
depends=('boost' 'websocketpp' 'openssl>=1.0.0')
makedepends=('cmake>=2.6.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Microsoft/cpprestsdk/archive/v$pkgver.tar.gz")
sha512sums=('7e77b1e202cc5ac660bd5d6e78b1f711eadc631a0e53fbbd30b0b102a7a574c411ad77ab8b75985a8be5c411c5ee929cd19c6f64c61ead825e3a40493850d9fc')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver/Release \
    -DBUILD_TESTS=OFF \
    -DBUILD_SAMPLES=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}
