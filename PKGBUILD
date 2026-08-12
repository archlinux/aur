# Maintainer: imsyy <imsyy1024@gmail.com>
pkgname=splayer-next-bin
pkgver=1.0.0
pkgrel=5
pkgdesc="A modern cross-platform music player built with Electron, Vue 3, and TypeScript"
arch=('x86_64')
url="https://github.com/SPlayer-Dev/SPlayer-Next"
license=('AGPL-3.0-only')
depends=(
  'c-ares'
  'ffmpeg'
  'gtk3'
  'http-parser'
  'libevent'
  'libvpx'
  'libxslt'
  'libxss'
  'minizip'
  'nss'
  're2'
  'snappy'
  'libnotify'
  'libappindicator-gtk3'
)
source=("https://github.com/SPlayer-Dev/SPlayer-Next/releases/download/v${pkgver}/splayer-next-${pkgver}-x64.pacman")
sha256sums=('9647c8eb23a3aaaf4b1debbdd65cbeabd67e2f0ce12566986524c14aa636623f')

package() {
  bsdtar -xf "$srcdir/splayer-next-${pkgver}-x64.pacman" --exclude='.*' -C "$pkgdir" --no-same-permissions --no-same-owner
  mv "$pkgdir/opt/SPlayer-Next" "$pkgdir/opt/splayer-next" 2>/dev/null || true
  ln -sf "/opt/splayer-next/SPlayer-Next" "$pkgdir/usr/bin/splayer-next" 2>/dev/null || true
  sed -i 's|/opt/SPlayer-Next/SPlayer-Next|/usr/bin/splayer-next|' "$pkgdir/usr/share/applications/"*.desktop 2>/dev/null || true
}
