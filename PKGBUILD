# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=soredowe-bin
_pkgname=soredowe
pkgver=0.5.2
_tag=v0.5.2
pkgrel=1
pkgdesc='Experimental GUI for pacman/AUR users who prefer it (Wayland/Vulkan)'
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/soredowe"
license=('GPL-3.0-only')
depends=(polkit wayland vulkan-icd-loader fontconfig hicolor-icon-theme git)
optdepends=(
  'yay: for installing from AUR'
)
provides=(soredowe)
conflicts=(soredowe)
options=(!strip)
source_x86_64=("soredowe-0.5.2-x86_64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/soredowe/releases/download/${_tag}/soredowe-0.5.2-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("soredowe-0.5.2-aarch64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/soredowe/releases/download/${_tag}/soredowe-0.5.2-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('1e0540b908e95eec8805d3cc1c7fa93a3901deb0f60f731183c81410d0bdce75')
sha256sums_aarch64=('7a144c5e03952962ca5cd2695812a782afbd8e42cd053d80e2cf047f851de10b')
source+=("icon.svg::https://raw.githubusercontent.com/mlm-games/soredowe/main/packaging/icons/hicolor/scalable/apps/soredowe.svg")
sha256sums+=('SKIP')

package() {
  local dir
  if [[ "$CARCH" == "x86_64" ]]; then
    dir="${srcdir}/soredowe-0.5.2-x86_64-unknown-linux-gnu"
  else
    dir="${srcdir}/soredowe-0.5.2-aarch64-unknown-linux-gnu"
  fi
  install -Dm755 "${dir}/soredowe" "${pkgdir}/usr/bin/soredowe"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/soredowe.desktop" << DESKTOP_EOF
[Desktop Entry]
Type=Application
Name=soredowe
GenericName=Package Manager
Comment=Browse and install packages from repositories and AUR
Exec=soredowe
Icon=soredowe
Terminal=false
Categories=System;PackageManager;
StartupNotify=true
DESKTOP_EOF

  install -Dm644 "${srcdir}/icon.svg" "${pkgdir}/usr/share/pixmaps/soredowe.svg"
  install -Dm644 "${srcdir}/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/soredowe.svg"
}
