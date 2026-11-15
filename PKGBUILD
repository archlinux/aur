# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=hyprmoncfg-bin
pkgver=1.29.0
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
source_x86_64=("https://github.com/crmne/hyprmoncfg/releases/download/v1.29.0/hyprmoncfg_1.29.0_linux_amd64.tar.gz")
source_aarch64=("https://github.com/crmne/hyprmoncfg/releases/download/v1.29.0/hyprmoncfg_1.29.0_linux_arm64.tar.gz")
sha256sums_x86_64=('b6c236018a627e39707b94f95ced0b3fc31dac41f80a9ef753544032d88bc142')
sha256sums_aarch64=('07e03fefbd73e4d9dae7209fb3e6e4410a2ee9c1cb725d471d80a6a5847510d7')

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
