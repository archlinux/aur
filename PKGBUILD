# Maintainer: Dexoron <main@dexoron.tech>
pkgname=codemotion-bin
pkgver=0.0.12_alpha
pkgrel=1
pkgdesc="Web-focused code editor and IDE for web developers"
arch=('x86_64')
url="https://github.com/cdmtn/CodeMotion"
license=('MIT')
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
provides=('codemotion')
conflicts=('codemotion')
options=('!strip' '!debug')

_upstreamver=0.0.12-alpha
source=(
  "codemotion-${_upstreamver}.pacman::https://github.com/cdmtn/CodeMotion/releases/download/v0.0.12/codemotion-${_upstreamver}.pacman"
  "LICENSE::https://raw.githubusercontent.com/cdmtn/CodeMotion/v0.0.12/LICENSE"
)
sha256sums=(
  '8d02c1c6822661abf9b5507e9ab4ca4fdeb50a7300b629129529a89c8d66ffbe'
  '97593e59237bde01858ef0b56db70649c8b14675a3768e39b448070c42a7189e'
)

package() {
  bsdtar -xf "$srcdir/codemotion-${_upstreamver}.pacman" -C "$pkgdir" \
    --exclude '.PKGINFO' \
    --exclude '.MTREE' \
    --exclude '.INSTALL'

  chmod 4755 "$pkgdir/opt/CodeMotion/chrome-sandbox"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/codemotion" <<'EOF'
#!/bin/sh
exec /opt/CodeMotion/codemotion-app "$@"
EOF

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
