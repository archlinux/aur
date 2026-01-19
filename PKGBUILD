# Maintainer: Rayen Stark <rayen.stark@protonmail.com>
pkgname=xboxdrv-blitz
_pkgname=Blitz
pkgver=0.1.0
pkgrel=2  # Changed from 1 to 2
pkgdesc="A modern GUI for xboxdrv to configure game controllers"
arch=('x86_64')
url="https://github.com/TheToxicSideOfMe/Blitz"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libappindicator-gtk3' 'xboxdrv' 'polkit')
makedepends=('rust' 'cargo' 'nodejs' 'pnpm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e4427e80ddda6fa93c28a161a30b742f15383060953d580568744d5abb85546a')

build() {
  cd "$_pkgname-$pkgver"
  
  pnpm install
  pnpm tauri build
}

package() {
  cd "$_pkgname-$pkgver"
  
  # The binary is actually called "blitz", not "xboxdrv-blitz"
  install -Dm755 \
    src-tauri/target/release/blitz \
    "$pkgdir/usr/bin/xboxdrv-blitz"

  install -Dm644 \
    src-tauri/icons/32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/xboxdrv-blitz.png"

  install -Dm644 \
    src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/xboxdrv-blitz.png"

  install -Dm644 \
    blitz.desktop \
    "$pkgdir/usr/share/applications/xboxdrv-blitz.desktop"
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
