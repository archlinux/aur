# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=tonepush-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Editor and tone library for Line 6 HX pedals and the StompStation PRO"
arch=('x86_64' 'aarch64')
url="https://tonepush.rocks"
license=('MIT')
install="${pkgname}.install"
optdepends=('libgl: for the GUI'
            'libxkbcommon: for the GUI'
            'wayland: for the GUI on Wayland'
            'libx11: for the GUI on X11'
            'p7zip: extract HX Edit model data from inside the app')
provides=('tonepush')
conflicts=('tonepush' 'tonepush-git' 'stompchain')
options=('!debug' '!strip')
_repo="https://github.com/crmne/tonepush"
source_x86_64=("${_repo}/releases/download/v${pkgver}/tonepush-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_repo}/releases/download/v${pkgver}/tonepush-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e030aa675c0e16e0d0431fa485d7258eadfd58cd6035c719e098e7e7de39cfd4')
sha256sums_aarch64=('4e6da4ab2f1eb122b89aad314fc5e044c4d445cb1f5ebeaf1a881b2a065e05fe')

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
