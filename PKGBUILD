# Maintainer: Graziano Pala <pala.graziano91 at gmail dot com>
pkgname=brother-dcp-l2665dw
pkgver=4.1.0
pkgrel=1
pkgdesc="CUPS and LPR drivers for the Brother DCP-L2665DW printer"
arch=("any")
url="https://www.brother.it/support/dcpl2665dw/downloads"
license=('GPL2' 'custom:Brother EULA')
depends=('cups')
source=(
    "https://download.brother.com/welcome/dlf106031/dcpl2665dwpdrv-4.1.0-1.i386.rpm"
)
md5sums=(
    'b6001eccd45b6bd1db62f9004f80b506'
)

prepare() {
  sed -i -e '75c\my $basedir = "/opt/brother/Printers/DCPL2665DW";' \
    ${srcdir}/opt/brother/Printers/DCPL2665DW/cupswrapper/lpdwrapper
}

package() {
  mkdir -p ${pkgdir}/usr/share/cups/model/Brother
  mkdir -p ${pkgdir}/usr/lib/cups/filter
  cp ${srcdir}/opt/brother/Printers/DCPL2665DW/cupswrapper/brother-DCPL2665DW-cups-en.ppd ${pkgdir}/usr/share/cups/model/Brother
  cp ${srcdir}/opt/brother/Printers/DCPL2665DW/cupswrapper/lpdwrapper ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_DCPL2665DW

  mkdir -p ${pkgdir}/opt/brother/Printers/DCPL2665DW/lpd/
  cp -r ${srcdir}/opt/brother/Printers/DCPL2665DW/inf ${pkgdir}/opt/brother/Printers/DCPL2665DW/
  cp ${srcdir}/opt/brother/Printers/DCPL2665DW/lpd/lpdfilter ${pkgdir}/opt/brother/Printers/DCPL2665DW/lpd/
  cp ${srcdir}/opt/brother/Printers/DCPL2665DW/lpd/${CARCH}/* ${pkgdir}/opt/brother/Printers/DCPL2665DW/lpd/
  cp -r ${srcdir}/var ${pkgdir}/
}
