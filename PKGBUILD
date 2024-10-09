# Maintainer: zllr <zhanglei9588[at]foxmail[dot]com>
# Based on brother-dcpt720dw by UrosV
# Based on brother-dcpt525w by Nick Pilipenko

pkgname=brother-dcpt725dw
pkgver=3.5.0
pkgrel=1
pkgdesc="Brother printer driver (lpd/cups) for the DCP-T725DW multifuncional printer"
url="https://support.brother.com/g/b/producttop.aspx?c=cn&lang=zh&prod=dcpt725dw_cn"
license=('custom: Brother License' 'EULA' 'GPL')
arch=('i686' 'x86_64')
optdepends=('sane: scanning support'
            'sane-airscan: SANE backend for AirScan (eSCL) and WSD document scanners'
            'brscan5: making dcpt820dw scaner available to sane'
            'brscan-skey: scankey support if connected via usb')

depends=('a2ps' 'cups')
depends_x86_64=('lib32-glibc')
install="dcpt725dw.install"

source=(
  "https://download.brother.com/pub/com/linux/linux/packages/dcpt725dwpdrv-$pkgver-$pkgrel.i386.deb" \
  "spool.patch"
)
sha256sums=(
  '7cae911da5bf7a3d6716049a4dbcd6c55823216df66136c96ddd710f7ed913b7' \
  '3d7f03c0c8fc9604f022f473daad8931a9f6d68b557b4febadc78f066b1031da'
)

package() {
  install_scripts="/opt/brother/Printers/dcpt725dw/scripts"
  scripts="${pkgdir}${install_scripts}"
  mkdir -p "${scripts}"
  tar -xf control.tar.gz -C "${scripts}"
  tar -xf data.tar.gz -C "${pkgdir}"
  cd "${pkgdir}"
  patch -Np0 < "${srcdir}/spool.patch"
}
