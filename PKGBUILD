# Maintainer: MLM Games <dev@mlm.games>
pkgname=renamite-bin
_pkgname=renamite
pkgver=0.2.7
_tag=v0.2.7
pkgrel=1
pkgdesc='Vector animation editor built on the Repose GUI framework'
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/renamite"
license=('MPL-2.0')
depends=()
provides=(renamite)
conflicts=(renamite)
options=(!strip)
source_x86_64=("renamite-0.2.7-x86_64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/renamite/releases/download/${_tag}/renamite-0.2.7-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("renamite-0.2.7-aarch64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/renamite/releases/download/${_tag}/renamite-0.2.7-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('2d917a33bd590bb2f7c44ccf1b4af75fff2c48fe83468f093d9ddbbe5f89ee96')
sha256sums_aarch64=('444519aae550b1c57c9f42553713d96d27ac7915c8e40805297ebf6e13bd237b')
source+=("icon.svg::https://raw.githubusercontent.com/mlm-games/renamite/main/others/packaging/icon.svg")
sha256sums+=('SKIP')

package() {
  local dir
  if [[ "$CARCH" == "x86_64" ]]; then
    dir="${srcdir}/renamite-0.2.7-x86_64-unknown-linux-gnu"
  else
    dir="${srcdir}/renamite-0.2.7-aarch64-unknown-linux-gnu"
  fi
  install -Dm755 "${dir}/renamite" "${pkgdir}/usr/bin/renamite"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/renamite.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=Renamite
Comment=Vector animation editor built on the Repose GUI framework
Exec=renamite %F
Icon=renamite
Terminal=false
Type=Application
Categories=Graphics;2DGraphics;VectorGraphics;
MimeType=application/x-renamite;application/json;
StartupNotify=true
StartupWMClass=renamite
DESKTOP_EOF

  install -Dm644 "${srcdir}/icon.svg" "${pkgdir}/usr/share/pixmaps/renamite.svg"
  install -Dm644 "${srcdir}/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/renamite.svg"
}
