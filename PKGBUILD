# Maintainer: Happilli <https://github.com/Happilli>
pkgname=warsa
pkgver=1.0.0
pkgrel=1
pkgdesc="Qt6 QML plugin for converting AD dates to BS"
arch=('x86_64')
url="https://github.com/Happilli/Warsa"
license=('MIT')
depends=('qt6-base' 'qt6-declarative')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Happilli/Warsa/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b9bd4f2d02315892a47b6ebf8cd775dec6b330bc838bc17b343663a1ba1160e0')

build() {
  cmake -B build -S "warsa-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -G Ninja
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "warsa-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
