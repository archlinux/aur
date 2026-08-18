# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=tonepush
pkgver=0.5.3
pkgrel=1
pkgdesc="Open-source editor for Line 6 Helix and HX pedals, with a GUI and a scriptable CLI"
arch=('x86_64' 'aarch64')
url="https://tonepush.rocks"
license=('MIT')
install="${pkgname}.install"
optdepends=('libgl: for the GUI'
            'libxkbcommon: for the GUI'
            'wayland: for the GUI on Wayland'
            'libx11: for the GUI on X11'
            'p7zip: extract HX Edit model data from inside the app')
conflicts=('tonepush-git' 'stompchain')
replaces=('stompchain')
options=('!debug' '!strip')
_repo="https://github.com/crmne/tonepush"
source_x86_64=("${_repo}/releases/download/v${pkgver}/tonepush-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_repo}/releases/download/v${pkgver}/tonepush-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ff3fbb4f83b86bffa8fcf9c58d76c36c1142b7ec7c513a5cf968775aea19c273')
sha256sums_aarch64=('434892ac5022980ef9b29d49a91210badd8d3b1b808ef32ce2ff89efc5d164cf')

package() {
  local target
  case "$CARCH" in
    x86_64) target="x86_64-unknown-linux-gnu" ;;
    aarch64) target="aarch64-unknown-linux-gnu" ;;
  esac
  local dir="${srcdir}/tonepush-v${pkgver}-${target}"

  install -Dm755 "${dir}/tonepush" "${pkgdir}/usr/bin/tonepush"
  install -Dm755 "${dir}/tonepush-gui" "${pkgdir}/usr/bin/tonepush-gui"
  install -Dm644 "${dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${dir}/packaging/applications/tonepush.desktop" \
    "${pkgdir}/usr/share/applications/tonepush.desktop"
  install -Dm644 "${dir}/packaging/icons/tonepush.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/tonepush.svg"
  install -Dm644 "${dir}/packaging/udev/70-line6-hx.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/70-line6-hx.rules"
}
