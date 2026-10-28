# Maintainer: Crstian <me@crstian.me>
#
# Prebuilt binary from the GitHub release (built on Ubuntu 24.04). The aur
# workflow sets pkgver and the checksum.

pkgname=herakleo-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Desktop IPTV player for M3U lists and Xtream Codes (prebuilt)'
arch=('x86_64')
url='https://github.com/crstian19/herakleo'
license=('GPL-3.0-or-later')
depends=('webkitgtk-6.0' 'gtk4' 'libsoup3' 'glib2' 'hicolor-icon-theme' 'glibc')
optdepends=(
  'mpv: default video player'
  'vlc: alternative video player'
  'celluloid: alternative video player'
  'haruna: alternative video player'
)
provides=('herakleo')
conflicts=('herakleo' 'herakleo-wails')
source=("$url/releases/download/v$pkgver/herakleo-$pkgver-linux-x86_64.tar.gz")
sha256sums=('a9e16457353e5349da9791ea4f72459b9039c765bd178038f7d4eb87154eabb6')

package() {
  cd "herakleo-$pkgver-linux-x86_64"
  install -Dm755 herakleo "$pkgdir/usr/bin/herakleo"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 me.crstian.Herakleo.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 me.crstian.Herakleo.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  local size
  for size in 128 256 512; do
    install -Dm644 "icons/$size.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/me.crstian.Herakleo.png"
  done
}
