# Maintainer: Manuel Alcocer J <m.alcocer1978@gmail.com>
pkgname=amule-remote-qt
pkgver=0.1.2
pkgrel=1
pkgdesc="Qt remote control for the aMule daemon over the EC protocol"
arch=('x86_64')
url="https://github.com/manuel-alcocer/amule-remote-qt"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-svg')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bd1477355200a35b701e99a9cff4a0709c9c6661b254035279e6604367b405c3')

build() {
  cmake -S "$pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DAMULE_REMOTE_QT_BUILD_TESTS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
