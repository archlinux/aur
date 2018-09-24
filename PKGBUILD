# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=tweeny
pkgver=2
pkgrel=1
pkgdesc="A modern C++ tweening library"
arch=('any')
url="http://mobius3.github.io/tweeny"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mobius3/tweeny/archive/$pkgver.tar.gz")
sha256sums=('3a5a4171b96ce85e90eea06b7b3bc80793a357b5638d49f6cf0531771fc2234a')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DTWEENY_BUILD_EXAMPLES=OFF \
    -DTWEENY_BUILD_DOCUMENTATION=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../$pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
