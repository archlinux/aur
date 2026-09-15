# Maintainer: MLM Games <dev@mlm.games>
pkgname=repadio-bin
_pkgname=repadio
pkgver=0.3.1
_tag=v0.3.1
pkgrel=1
pkgdesc='Pure-Rust audio player built with Symphonia and CPAL on the Repose GUI framework'
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/repadio"
license=('GPL-3.0-or-later')
depends=()
provides=(repadio)
conflicts=(repadio)
options=(!strip)
source_x86_64=("repadio-0.3.1-x86_64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/repadio/releases/download/${_tag}/repadio-0.3.1-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("repadio-0.3.1-aarch64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/repadio/releases/download/${_tag}/repadio-0.3.1-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('852cb13f4c224ca193b25a01ad165e4fb5f8e116c1472e6f68e13f214cf0d314')
sha256sums_aarch64=('4dac5ef6aabf8fd255a4350ae495f7d2f3ea8ebb7f75d73a0fe9131a9f86c7c3')
source+=("icon.svg::https://raw.githubusercontent.com/mlm-games/repadio/main/others/packaging/icon.svg")
sha256sums+=('SKIP')

package() {
  local dir
  if [[ "$CARCH" == "x86_64" ]]; then
    dir="${srcdir}/repadio-0.3.1-x86_64-unknown-linux-gnu"
  else
    dir="${srcdir}/repadio-0.3.1-aarch64-unknown-linux-gnu"
  fi
  install -Dm755 "${dir}/repadio" "${pkgdir}/usr/bin/repadio"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/repadio.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=Repadio
Comment=Pure-Rust audio player built with Symphonia and CPAL on the Repose GUI framework
Exec=repadio %F
Icon=repadio
Terminal=false
Type=Application
Categories=Audio;AudioVideo;Player;
MimeType=audio/mpeg;audio/flac;audio/ogg;audio/x-wav;audio/mp4;audio/aac;video/mp4;video/webm;video/x-matroska;video/quicktime;
StartupNotify=true
StartupWMClass=repadio
DESKTOP_EOF

  install -Dm644 "${srcdir}/icon.svg" "${pkgdir}/usr/share/pixmaps/repadio.svg"
  install -Dm644 "${srcdir}/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/repadio.svg"
}
