# Maintainer: MLM Games <dev@mlm.games>
pkgname=renamite-bin
_pkgname=renamite
pkgver=0.3.8
_tag=v0.3.8
pkgrel=1
pkgdesc='Vector animation editor built on the Repose GUI framework'
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/renamite"
license=('MPL-2.0')
depends=()
provides=(renamite)
conflicts=(renamite)
options=(!strip)
source_x86_64=("renamite-0.3.8-x86_64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/renamite/releases/download/${_tag}/renamite-0.3.8-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("renamite-0.3.8-aarch64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/renamite/releases/download/${_tag}/renamite-0.3.8-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('f274aef72c4a48e2cad6751282e4af13351f17e753a0fc1a4b9c2786a33f67bc')
sha256sums_aarch64=('af40991c784d89249d47b015b8ea11771592a5be6686225b051ce427f311d3d5')
source+=("icon.svg::https://raw.githubusercontent.com/mlm-games/renamite/main/others/packaging/icon.svg")
sha256sums+=('SKIP')

package() {
  local dir
  if [[ "$CARCH" == "x86_64" ]]; then
    dir="${srcdir}/renamite-0.3.8-x86_64-unknown-linux-gnu"
  else
    dir="${srcdir}/renamite-0.3.8-aarch64-unknown-linux-gnu"
  fi
  install -Dm755 "${dir}/renamite" "${pkgdir}/usr/bin/renamite"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/renamite.desktop" << DESKTOP_EOF
[Desktop Entry]
Type=Application
Version=1.5
Name=Renamite
Comment=Vector animation editor
Categories=Graphics;2DGraphics;VectorGraphics;
Keywords=animation;vector;lottie;repose;renamite;graphics;
Exec=renamite %F
Icon=renamite
Terminal=false
StartupNotify=true
StartupWMClass=renamite
MimeType=application/x-renamite;application/json;
DESKTOP_EOF

  install -Dm644 "${srcdir}/icon.svg" "${pkgdir}/usr/share/pixmaps/renamite.svg"
  install -Dm644 "${srcdir}/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/renamite.svg"
}
