# Maintainer: Nick Pilipenko <nick.pilipenko <at> gmail <dot> com>

pkgname=brother-dcpt525w
pkgver=3.5.0
pkgrel=1
pkgdesc="Brother printer driver (lpd/cups) for the DCP-T525W multifuncional printer"
url="https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=dcpt525w_eu"
license=('custom: Brother License' 'EULA' 'GPL')
arch=('i686' 'x86_64')
optdepends=('sane: scanning support'
            'sane-airscan: SANE backend for AirScan (eSCL) and WSD document scanners'
            'brscan5: making dcpt525w scaner available to sane'
            'brscan-skey: scankey support if connected via usb')

depends=('a2ps' 'cups')
depends_x86_64=('lib32-glibc')
install="dcpt525w.install"

source=(
  "https://download.brother.com/welcome/dlf105176/dcpt525wpdrv-$pkgver-$pkgrel.i386.deb" \
  "spool.patch"
)
sha256sums=(
  'fe959355e192cadba715d5e1388b2e5cd14023ee6f530d18aaa2488d2781364e' \
  '6dd51ead161ee5b287604c5b87f8451a138229260a93a69956091c342a3d7dc0'
)

package() {
  install_scripts="/opt/brother/Printers/dcpt525w/scripts"
  scripts="${pkgdir}${install_scripts}"
  mkdir -p "${scripts}"
  tar -xf control.tar.gz -C "${scripts}"
  tar -xf data.tar.gz -C "${pkgdir}"
  cd "${pkgdir}"
  patch -Np0 < "${srcdir}/spool.patch"
}
