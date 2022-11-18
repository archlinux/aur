# Maintainer: Michael Shikin <xavierelf <at> gmail <dot> com>

pkgname=brother-dcpt820dw
pkgver=3.5.0
pkgrel=1
pkgdesc="Brother printer driver (lpd/cups) for the DCP-T820DW multifuncional printer"
url="https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=dcpt820dw_all"
license=('custom: Brother License' 'EULA' 'GPL')
arch=('i686' 'x86_64')
optdepends=('sane: scanning support'
            'sane-airscan: SANE backend for AirScan (eSCL) and WSD document scanners'
            'brscan5: making dcpt820dw scaner available to sane'
            'brscan-skey: scankey support if connected via usb')

depends=('a2ps' 'cups')
depends_x86_64=('lib32-glibc')
install="dcpt820dw.install"

source=(
  "https://download.brother.com/welcome/dlf105183/dcpt820dwpdrv-$pkgver-$pkgrel.i386.deb" \
  "spool.patch"
)
sha256sums=(
  '6ed43c54bfdcf8e56b6a7a62af6d72424908ea7b0d887d8a7e2c422fd4152434' \
  '433d199b720e04a6fcb3da2d4324dccc2abf6d12e6c2fa10da0ba6150daeb728'
)

package() {
  install_scripts="/opt/brother/Printers/dcpt820dw/scripts"
  scripts="${pkgdir}${install_scripts}"
  mkdir -p "${scripts}"
  tar -xf control.tar.gz -C "${scripts}"
  tar -xf data.tar.gz -C "${pkgdir}"
  cd "${pkgdir}"
  patch -Np0 < "${srcdir}/spool.patch"
}
