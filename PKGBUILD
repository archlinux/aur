# Maintainer: Happilli <https://github.com/Happilli>
pkgname=ryu-kraken
pkgver=1.0.0
pkgrel=1
pkgdesc="Qt6 QML plugin for reading and writing JSON files"
arch=('x86_64')
url="https://github.com/Happilli/Kraken"
license=('MIT')
depends=('qt6-base' 'qt6-declarative')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Happilli/Kraken/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('331cb0fcbe7340da214291ffd9a7bf7560dcbe15679d419341101e8dcf9fd135')

build() {
  cmake -B build -S "Kraken-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -G Ninja
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "Kraken-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
