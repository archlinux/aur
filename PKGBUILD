# Maintainer: Happilli <https://github.com/Happilli>
pkgname=clipsh
pkgver=1.0.2
pkgrel=1
pkgdesc="Qt6 QML plugin for managing clipboard history via cliphist"
arch=('x86_64')
url="https://github.com/Happilli/clipsh"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'cliphist' 'wl-clipboard')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Happilli/clipsh/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0837c3644c175192ee0c8a1aabe2ad5f30a5e4e90a9663a215c854af3beba2ab')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -G Ninja
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
