# Maintainer: Jonathan Bangert <jonathan@bangert.dk>
pkgname='music-assistant-desktop-bin'
pkgver=0.0.17
pkgrel=2
pkgdesc="Music Assistant Companion App"
arch=('x86_64')
url="https://github.com/music-assistant/music-assistant-desktop"
conflicts=(music-assistant-desktop)
provides=(music-assistant-companion)
dependencies=(curl)
license=('Apache-2.0')
md5sums=('c3d18c9cf8ff9c558568acdfb4ae8062')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/music-assistant-companion-${pkgver}")

package() {
  cd "$srcdir/"

  curl -L -o music-assistant-companion.desktop https://raw.githubusercontent.com/music-assistant/music-assistant-desktop/v$pkgver/musicassistant.desktop
  curl -L -o music-assistant-desktop.png https://raw.githubusercontent.com/music-assistant/music-assistant-desktop/v$pkgver/src-tauri/icons/128x128.png
  curl -L -o squeezelite $url/releases/download/v$pkgver/squeezelite-x86_64-unknown-linux-gnu

  install -DCm644 ./music-assistant-companion.desktop "$pkgdir/usr/share/applications/music-assistant-companion.desktop"
  install -DCm644 ./music-assistant-companion.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/music-assistant-companion.png"
  install -DCm0755 ./$pkgname-$pkgver "$pkgdir/usr/bin/music-assistant-companion"
  install -DCm0755 ./squeezelite "$pkgdir/usr/bin/squeezelite"
}
