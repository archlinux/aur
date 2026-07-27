# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=retorrent-bin
_pkgname=retorrent
pkgver=0.3.4
_tag=0.3.4
pkgrel=1
pkgdesc="A BitTorrent client with an alpha/test UI, built in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/retorrent"
license=('GPL3')
depends=('glibc')
provides=('retorrent')
conflicts=('retorrent')
options=('!strip')

source_x86_64=("${_pkgname}-${_tag}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/retorrent/releases/download/${_tag}/${_pkgname}-${_tag}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${_tag}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/retorrent/releases/download/${_tag}/${_pkgname}-${_tag}-aarch64-unknown-linux-gnu.tar.gz")

source=("icon.png::https://raw.githubusercontent.com/mlm-games/retorrent/refs/heads/master/fastlane/metadata/android/en-US/images/icon.png")

sha256sums_x86_64=('d1d0cc0ef38029e87bc10a10662adbbb21e538cc1fdbec47d160a1be8ce96fff')
sha256sums_aarch64=('ad7aa5ad9b7e856c9dbaa0b31d5fa0504ceb0ede59c75ed631e3ed76c86aa26b')
sha256sums=('SKIP') # for icon.png

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
Name=Retorrent
Comment=A semi-modern BitTorrent client
Exec=${_pkgname} %U
Icon=${_pkgname}
Terminal=false
Type=Application
Categories=Network;FileTransfer;P2P;
MimeType=application/x-bittorrent;x-scheme-handler/magnet;
StartupNotify=true
StartupWMClass=retorrent
DESKTOP_EOF

  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}
