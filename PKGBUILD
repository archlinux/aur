# Maintainer: Your Name <your.email@example.com>
# Based on brother-dcpt720dw by Uros V
pkgname=brother-dcpt730dw
pkgver=3.6.1
pkgrel=1
pkgdesc="Brother printer driver (lpd/cups) for the DCP-T730DW multifuncional printer"
url="https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=dcpt730dw_all"
license=('custom: Brother License' 'EULA' 'GPL')
arch=('x86_64')
optdepends=('sane: scanning support'
            'sane-airscan: SANE backend for AirScan (eSCL) and WSD document scanners'
            'brscan4: making dcpt730dw scanner available to sane'
            'brscan-skey: scankey support if connected via usb')
depends=('a2ps' 'cups')
install="dcpt730dw.install"
source=(
  "https://download.brother.com/welcome/dlf106527/dcpt730dwpdrv-$pkgver-$pkgrel.amd64.deb" \
  "spool.patch"
)
sha256sums=(
  'b440b688d6be2e9a9a69a2bf4df3f56c90d52e149858bcfde3855eb0ca051890' \
  'cf9d1cece4f2797e8db4cfbccf81260b34dbbf046411d194c4f2db2a0af27a97'
)
package() {
  install_scripts="/opt/brother/Printers/dcpt730dw/scripts"
  scripts="${pkgdir}${install_scripts}"
  mkdir -p "${scripts}"
  tar -xf control.tar.gz -C "${scripts}"
  tar -xf data.tar.gz -C "${pkgdir}"
  cd "${pkgdir}"
  patch -Np0 < "${srcdir}/spool.patch"
}
