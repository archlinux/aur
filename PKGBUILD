# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=mtxclient
pkgver=0.4.1
pkgrel=1
pkgdesc="Client API library for Matrix, built on top of Boost.Asio<Paste>"
arch=('x86_64' 'i686')
url="https://github.com/Nheko-Reborn/mtxclient"
license=('MIT')
depends=('libolm' 'libsodium' 'openssl' 'boost-libs')
makedepends=('cmake' 'nlohmann-json' 'boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nheko-Reborn/mtxclient/archive/v$pkgver.tar.gz")
sha256sums=('edd2ac051cf8019579942107fd32ec67dbf3581829954b5cca07e74431b9770a')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_LIB_TESTS=OFF \
    -DBUILD_LIB_EXAMPLES=OFF \
    -DBUILD_SHARED_LIBS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../$pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
