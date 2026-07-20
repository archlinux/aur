# Maintainer: kurumihere <kurumihere@disroot.org>

pkgname=mp-player
pkgver=0.2.0
pkgrel=1
pkgdesc='music player'
arch=('x86_64')
url='https://github.com/kurumihere/mp'
license=('MIT')
depends=(
  'alsa-lib'
  'desktop-file-utils'
  'freetype2'
  'glib2'
  'glibc'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxext'
  'libxi'
  'libxinerama'
  'libxrandr'
)
optdepends=(
  'kdialog: file and folder dialogs on KDE Plasma'
  'yad: alternative GTK file and folder dialogs'
  'zenity: file and folder dialogs on GTK desktops'
)
conflicts=('mp' 'mp-player-bin' 'mp-player-git')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  'mp-player.desktop'
)
sha256sums=(
  'c755184f2b8d14bf46befe3bf11061b5d6439bf514f8282ee10dd5b5d907c170'
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
  install -Dm644 assets/fonts/OFL-*.txt \
    -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/mp-player.desktop" \
    "$pkgdir/usr/share/applications/mp-player.desktop"
  install -Dm644 assets/icon.png "$pkgdir/usr/share/pixmaps/mp.png"
}
