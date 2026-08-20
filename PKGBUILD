# Maintainer: VanillaGreen <ai1@vanillagreen.com>
pkgname=kendex-bin
pkgver=5.0.1
pkgrel=1
pkgdesc='Package manager for AI coding agents, skills, and hooks (desktop app and CLI)'
arch=('x86_64')
url='https://kendex.ai'
license=('MIT')
depends=('fuse2' 'hicolor-icon-theme')
provides=('kendex')
conflicts=('kendex' 'kendex-git')
options=('!strip')
source=(
  "kendex-app-$pkgver.AppImage::https://github.com/vanillagreencom/kendex/releases/download/v$pkgver/kendex_${pkgver}_amd64.AppImage"
  "kendex-$pkgver::https://github.com/vanillagreencom/kendex/releases/download/v$pkgver/kendex-x86_64-unknown-linux-gnu"
  "kendex.png::https://raw.githubusercontent.com/vanillagreencom/kendex/v$pkgver/crates/app/icons/128x128.png"
)
sha256sums=(
  '655180e2ba03b91746bb28c6f1ac49ce6684958fa5d6bd20bf4bc9d932973206'
  'a3dee4c286614016198db72603fcf95de277ddf1a245da052dc815821f0e84c0'
  '4ea797c32fc7754254505058574cdf080c90075a6e7995e30b27c6f939953e9d'
)

package() {
  # The desktop app stays off PATH so the `kendex` command is the CLI.
  install -Dm755 "$srcdir/kendex-app-$pkgver.AppImage" "$pkgdir/usr/lib/kendex/kendex.AppImage"
  install -Dm755 "$srcdir/kendex-$pkgver" "$pkgdir/usr/bin/kendex"
  install -Dm644 "$srcdir/kendex.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/kendex.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/kendex.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=kendex
Comment=Manage AI coding agents, skills, and hooks
Exec=/usr/lib/kendex/kendex.AppImage
Icon=kendex
Categories=Development;Utility;
Terminal=false
DESKTOP
}
