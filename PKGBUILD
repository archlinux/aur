# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=hyprmoncfg-bin
pkgver=1.19.1
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
source_x86_64=("https://github.com/crmne/hyprmoncfg/releases/download/v1.19.1/hyprmoncfg_1.19.1_linux_amd64.tar.gz")
source_aarch64=("https://github.com/crmne/hyprmoncfg/releases/download/v1.19.1/hyprmoncfg_1.19.1_linux_arm64.tar.gz")
sha256sums_x86_64=('166e4fc9335f47bb23e88a356d830126a4f1e0a9604605b6b02b6c76bd77e07d')
sha256sums_aarch64=('69ce5d46235238b99b64f38e507e99661c98f5a5eb524dd3e4252e7adcd920fe')

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
