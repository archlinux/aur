# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_org>

pkgname='hopper'
_pkgname='hopperv4'
pkgver='4.1.2'
pkgrel='2'
pkgdesc='Reverse engineering tool that lets you disassemble, decompile and debug your applications'
arch=('x86_64')
url='https://www.hopperapp.com/'
license=('Commercial')
depends=('hicolor-icon-theme' 'libbsd' 'python2' 'qt5-base')
provides=("${pkgname}" "${_pkgname}")
conflicts=("${pkgname}" "${_pkgname}")
source=("https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-v4-${pkgver}-Linux.pkg.tar.xz")
sha256sums=('f275897adf1eb4507a71c6f5a1b2b28176e6641f5c278977c071f43dbecb015d')

package() {
  # Copy package content
  cp -r ${srcdir}/opt ${pkgdir}/opt
  cp -r ${srcdir}/usr ${pkgdir}/usr

  # Move docs to /opt
  mv ${pkgdir}/usr/share/doc/hopperv4 ${pkgdir}/opt/hopper-v4/doc
  rmdir ${pkgdir}/usr/share/doc

  # Remove launcher from Accessories
  sed -i '10s|Utility;||' ${pkgdir}/usr/share/applications/hopper-v4.desktop
  # Pass launcher script args forward
  sed -i '3s|Hopper|Hopper "$@"|' ${pkgdir}/opt/hopper-v4/bin/hopper-launcher.sh

  #TODO locate license file
  #install -Dm644 license ${pkgdir}/usr/share/licenses/${pkgname}/license
}
