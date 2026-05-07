# Maintainer: Happilli <https://github.com/Happilli>
pkgname=cleave
pkgver=1.0.0
pkgrel=1
pkgdesc="Qt6 QML plugin for audio visualization"
arch=('x86_64')
url="https://github.com/Happilli/Cleave"
license=('MIT')
depends=('qt6-base' 'qt6-declarative')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Happilli/Cleave/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('47425de76d8fb55cca29705b5a0c12d291c4cb1f3d316aa96dad65deae8f36c1')

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
