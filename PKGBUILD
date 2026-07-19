# Maintainer: kurumihere <kurumihere@disroot.org>

pkgname=mp-player
pkgver=0.1.1
pkgrel=1
pkgdesc='music player'
arch=('x86_64')
url='https://github.com/kurumihere/mp'
license=('MIT')
depends=(
  'alsa-lib'
  'desktop-file-utils'
  'glibc'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxext'
  'libxi'
  'libxinerama'
  'libxrandr'
)
conflicts=('mp' 'mp-player-bin')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  'mp-player.desktop'
)
sha256sums=(
  '23871b4da0f4f7088a7d81dfb6f7ba4085d1a6214eb75e406e08c347482b2d9f'
  '3fc25e2c0284de96df98f979f5c1445cb8ae3024592db54002a5cc9d9c46a479'
)

build() {
  cd "mp-$pkgver"

  "${CC:-cc}" -std=c99 -o nob nob.c
  ./nob
}

package() {
  cd "mp-$pkgver"

  install -Dm755 build/mp "$pkgdir/usr/bin/mp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 assets/OFL.txt \
    "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/mp-player.desktop" \
    "$pkgdir/usr/share/applications/mp-player.desktop"
  install -Dm644 assets/icon.png "$pkgdir/usr/share/pixmaps/mp.png"
}
