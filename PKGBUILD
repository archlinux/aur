# Maintainer: Happilli <https://github.com/Happilli>
pkgname=sqliter
pkgver=1.0.0
pkgrel=1
pkgdesc="japanese hiragana, katakana, kanji and event calendar manager plugin.."
arch=('x86_64')
url="https://github.com/Happilli/sqliter"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'cliphist' 'wl-clipboard')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Happilli/sqliter/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('149c1ae4d2c1de2f10c77de0dfcd1498624f3d2f9ccfc0135ca4fae688bdbc15')

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
