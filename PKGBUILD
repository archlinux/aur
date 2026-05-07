# Maintainer: Happilli <https://github.com/Happilli>
pkgname=clipsh
pkgver=1.0.0
pkgrel=1
pkgdesc="Qt6 QML plugin for managing clipboard history via cliphist"
arch=('x86_64')
url="https://github.com/Happilli/clipsh"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'cliphist' 'wl-clipboard')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Happilli/clipsh/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7ae26b6954b3d4db3c3b9f8fc9e0d39be8e6f3686ab3f765ac871e18a1622669')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -G Ninja
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -dm755 "$pkgdir/usr/lib/qt6/qml"
  mv "$pkgdir/usr/Clipsh" "$pkgdir/usr/lib/qt6/qml/Clipsh"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
