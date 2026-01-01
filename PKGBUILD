# Maintainer: Dave Daynard <nardholio@gmail.com>
# Contributor: Wartybix <34974060+Wartybix@users.noreply.github.com>
pkgname=reboot-to-windows
pkgver=1.6
_commit=920dc7a78c6850537cd067d9f32bd1cf18c0e20b
pkgrel=1
pkgdesc="Application to quickly reboot to Windows from Linux, bypassing the boot menu."
arch=('any')
url="https://github.com/nardholio/reboot-to-windows"
license=('GPL-3.0-only')
depends=('polkit' 'efibootmgr' 'bash')
optdepends=('qt5-tools: Reboot screen support for KDE')
options=('!debug')
install=reboot-to-windows.install
source=(git+https://github.com/nardholio/reboot-to-windows.git#commit=${_commit})
sha256sums=('df332f3e644363372b98e4724b489d8e1791574ea29ae0fd6a6d4dbf6b5f8d36')

package_reboot-to-windows() {
  cd "${srcdir}/reboot-to-windows"

  # Install the main files
  install -Dm644 icons/reboot-to-windows.svg "${pkgdir}/usr/share/pixmaps/reboot-to-windows.svg"
  install -Dm755 scripts/reboot-to-windows.sh "${pkgdir}/usr/bin/reboot-to-windows"
  install -Dm644 reboot-to-windows.desktop "${pkgdir}/usr/share/applications/reboot-to-windows.desktop"

  # Provide polkit files in /usr/share/doc for optional manual installation
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/polkit"
  install -m644 polkit/wartybix.reboot-to-windows.policy "${pkgdir}/usr/share/doc/${pkgname}/polkit/"
  install -m644 polkit/50-wartybix.reboot-to-windows.rules "${pkgdir}/usr/share/doc/${pkgname}/polkit/"
}
