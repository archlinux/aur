# Maintainer: Rayen Stark <rayen.stark@protonmail.com>
pkgname=xboxdrv-blitz
_pkgname=xboxdrv-blitz
pkgver=0.1.1
pkgrel=1
pkgdesc="A modern GUI for xboxdrv to configure game controllers"
arch=('x86_64')
url="https://github.com/TheToxicSideOfMe/xboxdrv-blitz"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libappindicator-gtk3' 'xboxdrv' 'polkit')
makedepends=('rust' 'cargo' 'nodejs' 'pnpm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('11bfacf23477d9ff360bc6dd836ca8a3fc1a2dc6bd0b2195f57dbc77269df2b4')

build() {
  cd "$_pkgname-$pkgver"
  
  pnpm install
  pnpm tauri build
}

package() {
  cd "$_pkgname-$pkgver"
  
  install -Dm755 \
    src-tauri/target/release/xboxdrv-blitz \
    "$pkgdir/usr/bin/xboxdrv-blitz"

  install -Dm644 \
    src-tauri/icons/32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/xboxdrv-blitz.png"

  install -Dm644 \
    src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/xboxdrv-blitz.png"

  install -Dm644 \
    xboxdrv-blitz.desktop \
    "$pkgdir/usr/share/applications/xboxdrv-blitz.desktop"
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
