# Maintainer: taxin <mbthunter007@gmail.com>
pkgname=templar-arena-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="90s-inspired free-to-play multiplayer arena shooter set in a dark fantasy world"
arch=('x86_64')
url="https://github.com/taxin-404/templar-arena-bin"
license=('custom')
depends=('libgl' 'libx11' 'libxcursor')
options=('!strip')
source=(
  "templar-arena-v${pkgver}-linux.zip::https://github.com/taxin-404/templar-arena-bin/releases/download/v${pkgver}/templar-arena-v${pkgver}-linux.zip"
  "templar-arena.png"
  "templar-arena.desktop"
)
sha256sums=('SKIP'
  'SKIP'
  'SKIP')

prepare() {
  chmod +x "${srcdir}/Templar Arena.x86_64"
}

package() {
  # game files
  install -dm755 "${pkgdir}/opt/templar-arena"
  cp -r "${srcdir}/Templar Arena_Data" "${pkgdir}/opt/templar-arena/"
  install -Dm755 "${srcdir}/Templar Arena.x86_64" "${pkgdir}/opt/templar-arena/Templar Arena.x86_64"
  install -Dm755 "${srcdir}/UnityPlayer.so" "${pkgdir}/opt/templar-arena/UnityPlayer.so"

  # wrapper script
  install -dm755 "${pkgdir}/usr/bin"
  cat >"${pkgdir}/usr/bin/templar-arena" <<'EOF'
#!/bin/bash
cd /opt/templar-arena
exec "/opt/templar-arena/Templar Arena.x86_64" "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/templar-arena"

  # icon
  install -Dm644 "${srcdir}/templar-arena.png" "${pkgdir}/usr/share/pixmaps/templar-arena.png"

  # desktop entry
  install -Dm644 "${srcdir}/templar-arena.desktop" "${pkgdir}/usr/share/applications/templar-arena.desktop"
}
