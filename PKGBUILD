# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Michael Yang <ohmyarchlinux@pm.me>

pkgname=spdlog
pkgver=1.3.0
pkgrel=1
pkgdesc='Very fast, header only, C++ logging library'
arch=('any')
url='https://github.com/gabime/spdlog'
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gabime/spdlog/archive/v$pkgver.tar.gz")
sha256sums=('78786c641ca278388107e30f1f0fa0307e7e98e1c5279c3d29f71a143f9176b6')

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
