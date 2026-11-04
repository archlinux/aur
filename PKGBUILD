# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=tonepush-bin
pkgver=0.12.0
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
sha256sums_x86_64=('84f668614a63c8ef89f0c6385f85ac01e675c006c62a901f3b4ff4c438bc7c52')
sha256sums_aarch64=('c4fa6085eca6de450ec33fe474a7d33c43654bc29ad6182c5127e2f38352af31')

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
