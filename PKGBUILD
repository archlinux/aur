# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=tweeny
pkgver=3.2.0
pkgrel=1
pkgdesc="A modern C++ tweening library"
arch=('any')
url="http://mobius3.github.io/tweeny"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mobius3/tweeny/archive/v$pkgver.tar.gz")
sha256sums=('2be7db9e0354da31f020b77474e2d547dbbaa8999a6a4bea4b388e6d31e4ef07')

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
