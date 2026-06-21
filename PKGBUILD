# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=retorrent-bin
_pkgname=retorrent
pkgver=0.2.7
pkgrel=1
pkgdesc="A BitTorrent client with an alpha/test UI, built in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/retorrent"
license=('GPL3')
depends=('gtk3' 'glibc')
optdepends=('libappindicator-gtk3: system tray icon')
provides=('retorrent')
conflicts=('retorrent')
options=('!strip')

source_x86_64=("${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/retorrent/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/retorrent/releases/download/${pkgver}/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")

source=("icon.png::https://raw.githubusercontent.com/mlm-games/retorrent/refs/heads/master/fastlane/metadata/android/en-US/images/icon.png")

sha256sums_x86_64=('3007d668097acbf1a305ecd406847418decb5a1b94cc02c7f1ef47a7dd3618fc')
sha256sums_aarch64=('a0f80e75ae0db3cff28bd3582ecf10cd2ce4a6d161339e9b8b09ff581d3ad23f')
sha256sums=('SKIP') # for icon.png

package() {
  local target
  if [[ "$CARCH" == "x86_64" ]]; then
    target="x86_64-unknown-linux-gnu"
  else
    target="aarch64-unknown-linux-gnu"
  fi

  local dir="${srcdir}/${_pkgname}-${pkgver}-${target}"
  install -Dm755 "${dir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=Retorrent
Comment=A semi-modern BitTorrent client
Exec=${_pkgname} %F
Icon=${_pkgname}
Terminal=false
Type=Application
Categories=Network;FileTransfer;P2P;
MimeType=application/x-bittorrent;x-scheme-handler/magnet;
StartupNotify=true
DESKTOP_EOF

  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}
