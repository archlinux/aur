# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=hyprmoncfg-bin
pkgver=1.23.0
pkgrel=1
pkgdesc="Terminal-first monitor configurator and auto-switching daemon for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/hyprmoncfg"
license=('MIT')
install="${pkgname}.install"
depends=('hyprland' 'xdg-terminal-exec')
optdepends=('systemd: user service for automatic profile switching')
provides=('hyprmoncfg')
conflicts=('hyprmoncfg' 'hyprmoncfg-git')
options=('!debug' '!strip')
source_x86_64=("https://github.com/crmne/hyprmoncfg/releases/download/v1.23.0/hyprmoncfg_1.23.0_linux_amd64.tar.gz")
source_aarch64=("https://github.com/crmne/hyprmoncfg/releases/download/v1.23.0/hyprmoncfg_1.23.0_linux_arm64.tar.gz")
sha256sums_x86_64=('154a0b9d84ab2179c74262d1d99d59552219b178abe0acaf3f48d8659f0dfe4e')
sha256sums_aarch64=('9ef9ff250f227ecfbaa6cf6aac47e9cb7548159fde1d8d2eb63daea1ca866dbc')

package() {
  cd "${srcdir}"

  install -Dm755 "hyprmoncfg" "${pkgdir}/usr/bin/hyprmoncfg"
  install -Dm755 "hyprmoncfgd" "${pkgdir}/usr/bin/hyprmoncfgd"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "packaging/applications/hyprmoncfg.desktop" "${pkgdir}/usr/share/applications/hyprmoncfg.desktop"
  sed -i \
    -e 's|^Exec=.*|Exec=xdg-terminal-exec --app-id=TUI.float -e hyprmoncfg|' \
    -e 's/^Terminal=true$/Terminal=false/' \
    -e 's/^StartupNotify=false$/StartupNotify=true/' \
    "${pkgdir}/usr/share/applications/hyprmoncfg.desktop"
  install -Dm644 "packaging/applications/hyprmoncfg-omarchy.desktop" "${pkgdir}/usr/share/applications/hyprmoncfg-omarchy.desktop"
  install -Dm644 "packaging/icons/hyprmoncfg.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/hyprmoncfg.svg"
  install -Dm644 "packaging/systemd/hyprmoncfgd.service" "${pkgdir}/usr/lib/systemd/user/hyprmoncfgd.service"
}
