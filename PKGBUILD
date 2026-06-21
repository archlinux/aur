# Maintainer: Manuel Alcocer J <m.alcocer1978@gmail.com>
# User manual: https://linuxarena.net/en/wiki/p2p/amule-remote-qt/ (es: /es/wiki/p2p/amule-remote-qt/)
pkgname=amule-remote-qt
pkgver=0.1.2
pkgrel=2
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
  # Ship a pointer to the online user manual (linuxarena wiki).
  printf '%s\n' \
    'aMule Remote — user manual' \
    'English: https://linuxarena.net/en/wiki/p2p/amule-remote-qt/' \
    'Español: https://linuxarena.net/es/wiki/p2p/amule-remote-qt/' \
    | install -Dm644 /dev/stdin "$pkgdir/usr/share/doc/$pkgname/MANUAL"
}
