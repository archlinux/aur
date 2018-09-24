# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Michael Yang <ohmyarchlinux@pm.me>

pkgname=spdlog
pkgver=1.1.0
pkgrel=1
pkgdesc='Very fast, header only, C++ logging library'
arch=('any')
url='https://github.com/gabime/spdlog'
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gabime/spdlog/archive/v$pkgver.tar.gz")
md5sums=('cc8684ba8460ab15dc5f523f6905603d')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
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
