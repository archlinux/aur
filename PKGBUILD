# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=soredowe-bin
_pkgname=soredowe
pkgver=0.4.4
_tag=v0.4.4
pkgrel=1
pkgdesc="Experimental GUI for pacman/AUR users who prefer it (Wayland/Vulkan)"
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/soredowe"
license=('GPL3')
depends=('polkit' 'wayland' 'vulkan-icd-loader' 'fontconfig' 'hicolor-icon-theme' 'git')
optdepends=(
  'yay: for installing from AUR'
)
provides=('soredowe')
conflicts=('soredowe')
options=('!strip')

source_x86_64=("${_pkgname}-${_tag}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/soredowe/releases/download/${_tag}/${_pkgname}-${_tag}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${_tag}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/soredowe/releases/download/${_tag}/${_pkgname}-${_tag}-aarch64-unknown-linux-gnu.tar.gz")
# Icon
source=("icon.svg::https://raw.githubusercontent.com/mlm-games/soredowe/refs/heads/main/packaging/icons/hicolor/scalable/apps/soredowe.svg")

sha256sums_x86_64=('50228051b956a24424e4b095e51b89788b52aee29a20dddb337d6d14aa95594d')
sha256sums_aarch64=('df372cc836f46eb88ea9fc829249c94dbb99415223d032e63c978cf7d1813a0e')
sha256sums=('SKIP') # for icon.svg

package() {
  local target
  if [[ "$CARCH" == "x86_64" ]]; then
    target="x86_64-unknown-linux-gnu"
  else
    target="aarch64-unknown-linux-gnu"
  fi

  local dir="${srcdir}/${_pkgname}-${_tag}-${target}"
  install -Dm755 "${dir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=soredowe
Comment=GUI for pacman/AUR users who prefer it (Wayland/Vulkan)
Exec=${_pkgname}
Icon=${_pkgname}
Terminal=false
Type=Application
Categories=System;PackageManager;
StartupNotify=true
DESKTOP_EOF

  # Icon
  install -Dm644 "${srcdir}/icon.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"
}
