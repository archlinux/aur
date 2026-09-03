pkgname=hyprmoncfg-bin
pkgver=1.17.1
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
source_x86_64=("${url}/releases/download/v${pkgver}/hyprmoncfg_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/hyprmoncfg_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f7412ded69715772a0a1abaf0b793885d1d86da815e996c54f361c7dc7d0f66d')
sha256sums_aarch64=('d4b628a9b12b70d05b988de916a63d362b0a8b08605cc25f3c0e7a4a400495db')

package() {
  install -Dm755 "${srcdir}/hyprmoncfg" "${pkgdir}/usr/bin/hyprmoncfg"
  install -Dm755 "${srcdir}/hyprmoncfgd" "${pkgdir}/usr/bin/hyprmoncfgd"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/packaging/applications/hyprmoncfg.desktop" "${pkgdir}/usr/share/applications/hyprmoncfg.desktop"
  sed -i \
    -e 's|^Exec=.*|Exec=xdg-terminal-exec --app-id=TUI.float -e hyprmoncfg|' \
    -e 's/^Terminal=true$/Terminal=false/' \
    -e 's/^StartupNotify=false$/StartupNotify=true/' \
    "${pkgdir}/usr/share/applications/hyprmoncfg.desktop"
  install -Dm644 "${srcdir}/packaging/applications/hyprmoncfg-omarchy.desktop" "${pkgdir}/usr/share/applications/hyprmoncfg-omarchy.desktop"
  install -Dm644 "${srcdir}/packaging/icons/hyprmoncfg.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/hyprmoncfg.svg"
  install -Dm644 "${srcdir}/packaging/systemd/hyprmoncfgd.service" "${pkgdir}/usr/lib/systemd/user/hyprmoncfgd.service"
}
