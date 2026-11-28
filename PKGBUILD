# Contributor: Grey Christoforo <first name at last name dot net>
# Contributor: Marcel Robitaille <mail@marcelrobitaille.me>
# Contributor: mickael9 <mickael9 at gmail dot com>
# Contributor: Rex McKinnon <0xFF at rexploits dot com>
# Contributor: thodnev <thodnev at github>
# Contributor: xiota

_number_of_bits=32
pkgname=microchip-mplabxc${_number_of_bits}-bin
pkgver=6.00
pkgrel=1
pkgdesc="Microchip's MPLAB XC${_number_of_bits} C compiler toolchain for all of their 32bit microcontrollers"
url=https://www.microchip.com/en-us/tools-resources/develop/mplab-xc-compilers
license=('LicenseRef-MPLAB-XC-Unified')
arch=(x86_64)

depends=(gcc-libs)

install=$pkgname.install

options=(!strip docs libtool emptydirs !zipman staticlibs)
source=("https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/xc${_number_of_bits}-v${pkgver}-full-install-linux-x64.tar.xz")
sha256sums=('a87e747a9df5cdc33069cd2bdcbac7e8d67e14fcaf3e75c46da831817f204eb4')

_instdir="opt/microchip/xc${_number_of_bits}/v${pkgver}"

package() {
  mkdir -p "${pkgdir}/${_instdir}"

  mv "xc${_number_of_bits}-v${pkgver}"/* "${pkgdir}/${_instdir}"
  ln -sf "v${pkgver}" "${pkgdir}/opt/microchip/xc${_number_of_bits}/latest"

  mkdir -p "${pkgdir}/usr/bin"
  for f in "${pkgdir}/${_instdir}/bin/xc${_number_of_bits}"-*; do
    local bname=$(basename $f)
    ln -sf "/${_instdir}/bin/${bname}" "${pkgdir}/usr/bin"
  done

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/${_instdir}/docs/$(basename "${pkgdir}/${_instdir}/docs"/*[Ll]icense.txt)" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
