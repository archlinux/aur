# Maintainer: horizzon3507 <148660626+horizzon3507@users.noreply.github.com>
# Unofficial AUR packaging of upstream Synara desktop AppImage releases.
# Upstream: https://github.com/Emanuele-web04/synara

pkgname=synara
pkgver=0.5.5
pkgrel=1
pkgdesc="Minimal desktop GUI for coding agents (Codex, Claude, Cursor, and more)"
arch=('x86_64')
url="https://trysynara.com"
license=('MIT')
depends=('fuse2' 'zlib' 'glibc' 'hicolor-icon-theme')
conflicts=('synara-bin')
options=('!strip' '!debug')
source=(
  "Synara-${pkgver}-x86_64.AppImage::https://github.com/Emanuele-web04/synara/releases/download/v${pkgver}/Synara-${pkgver}-x86_64.AppImage"
  "synara.desktop"
  "synara.png"
  "LICENSE::https://raw.githubusercontent.com/Emanuele-web04/synara/v${pkgver}/LICENSE"
)
sha256sums=(
  '597a6e2af3fa770a0670532dd5e626bb6e205c5e4a5f3f296a69b5eb7fbd25e8'
  '7a9888dbb0f79a0c718c786f2317f458a1056a9c50d445f0ab4f9305e6377196'
  '3914e01ffa931a12adef6531e90adbdeb1a267cf3721dbfe8291fe81a77b05b3'
  '6c263925edf74f9255c979b585b2b012b16c730f4c455a0aad4db8ddd5c91c5f'
)

package() {
  install -Dm755 "Synara-${pkgver}-x86_64.AppImage" \
    "${pkgdir}/opt/${pkgname}/synara.AppImage"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/synara" <<'EOF'
#!/bin/sh
exec /opt/synara/synara.AppImage "$@"
EOF

  install -Dm644 synara.desktop \
    "${pkgdir}/usr/share/applications/synara.desktop"
  install -Dm644 synara.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/synara.png"
  install -Dm644 synara.png \
    "${pkgdir}/usr/share/pixmaps/synara.png"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
