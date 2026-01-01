# Maintainer: Dave Daynard <nardholio@gmail.com>
# Contributor: Wartybix <34974060+Wartybix@users.noreply.github.com>
pkgname=reboot-to-windows
pkgver=1.6.1
_commit=1de324cbb0cff932ab6b3818f16e1ed9ed0c54ec
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
sha256sums=('f170861af8774bfd706fc0885835f8fa4d6dd7c6f38fdc256014c4a30175f329')

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
