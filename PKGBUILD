# Maintainer: badcast <lmecomposer@gmail.com>

pkgname=brainmap-gui
pkgver=1.1.0
pkgrel=1
pkgdesc="GUI maze generator using library-brainmap"
arch=('x86_64')
url="https://github.com/badcast/library-brainmap"
license=('MIT')
depends=('library-brainmap')
makedepends=('gcc' 'pkgconf')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/badcast/library-brainmap/archive/refs/tags/v$pkgver.tar.gz"
  "brainmap.desktop"
  "brainmap-gui.png"
)
sha256sums=('ee5e3564e02fe615400c9c315b35eee8bed10bedba43377792348d8a6f39e4d7'
            'c246b3c062633a230c3a6c2bee3b95f3f348cb620a9747eb47bc9a39d6fff4aa'
            '038a810ba8b17a45a79f8bbca3ddd8c4c3ab8ae390a48c0f309c135fefc05759')

build() {
  cd "library-brainmap-$pkgver"
  g++ -O3 $(pkg-config gtk4 --cflags --libs) -std=c++17 -Iinclude test/guitest.cpp -o brainmap-gui
}

package() {
  cd "library-brainmap-$pkgver"
  install -Dm755 brainmap-gui "$pkgdir/usr/bin/brainmap-gui"
  install -Dm644 "$srcdir/brainmap.desktop" "$pkgdir/usr/share/applications/brainmap.desktop"
  install -Dm644 "$srcdir/brainmap-gui.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/brainmap-gui.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
