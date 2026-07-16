# Maintainer: Rex McKinnon <0xFF at rexploits dot com>
# Contributor: xiota
# Contributor: Grey Christoforo <first name at last name dot net>
# Contributer: mickael9 <mickael9 at gmail dot com>

pkgname=microchip-mplabxc8-bin
pkgver=4.00
pkgrel=1
pkgdesc="Powerful, optimizing compiler for use with 8-bit PIC and AVR microcontrollers"
url="https://www.microchip.com/mplab/compilers"
license=('LicenseRef-MPLAB-XC-Unified')
arch=('x86_64')

depends=(gcc-libs)

install=$pkgname.install

options=(!strip docs libtool emptydirs !zipman staticlibs)

_dl_url="https://ww1.microchip.com"
_dl_path="downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools"
_dl_file="xc8-v${pkgver}-full-install-linux-x64.tar.xz"

source=("$_dl_file"::"$_dl_url/$_dl_path/$_dl_file")
sha256sums=('a24104a8f1fa3dcd2e18d8e42c08485a6c26d5789960ed8bcc7e6bdc2c6b46c6')

_instdir="opt/microchip/xc8/v${pkgver}"

package() {
  mkdir -p "${pkgdir}/${_instdir}"
  mkdir -p "${pkgdir}/${_instdir}/etc"
  mv "xc8-v${pkgver}"/* "${pkgdir}/${_instdir}"

  mkdir -p "${pkgdir}/etc/profile.d"
  echo "export PATH=\"\$PATH\":'/${_instdir}/bin'" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
  echo "export XC8_TOOLCHAIN_ROOT='/${_instdir}'" >> "${pkgdir}/etc/profile.d/${pkgname}.sh"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/${_instdir}/docs/$(basename "${pkgdir}/${_instdir}/docs"/*[Ll]icense.txt)" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
