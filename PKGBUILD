# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Michael Yang <ohmyarchlinux@pm.me>

pkgname=spdlog
pkgver=1.3.1
pkgrel=1
pkgdesc='Very fast, header only, C++ logging library'
arch=('any')
url='https://github.com/gabime/spdlog'
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gabime/spdlog/archive/v$pkgver.tar.gz")
sha256sums=('160845266e94db1d4922ef755637f6901266731c4cb3b30b45bf41efa0e6ab70')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DSPDLOG_BUILD_BENCH=OFF \
    -DSPDLOG_BUILD_EXAMPLES=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

check() {
  cd build
  make test
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../$pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
