# Maintainer: Gustavo Jasso <gustavo at jasso dot info>
pkgname=brother-dcp-l2660dw
pkgver=4.1.0
pkgrel=1
pkgdesc="CUPS and LPR drivers for the Brother DCP-L2660DW printer"
arch=('i686' 'x86_64')
url="https://www.brother.de/support/dcp-l2660dw/downloads"
license=('GPL2' 'custom:Brother EULA')
depends=('cups')
source=(
    "https://download.brother.com/welcome/dlf106029/dcpl2660dwpdrv-4.1.0-1.i386.rpm"
)
md5sums=(
    '47ac5a16159e28c799e783417f6bb576'
)

prepare() {
  sed -i -e '75c\my $basedir = "/opt/brother/Printers/DCPL2660DW";' \
    ${srcdir}/opt/brother/Printers/DCPL2660DW/cupswrapper/lpdwrapper
}

package() {
  mkdir -p ${pkgdir}/usr/share/cups/model/Brother
  mkdir -p ${pkgdir}/usr/lib/cups/filter
  cp ${srcdir}/opt/brother/Printers/DCPL2660DW/cupswrapper/brother-DCPL2660DW-cups-en.ppd ${pkgdir}/usr/share/cups/model/Brother
  cp ${srcdir}/opt/brother/Printers/DCPL2660DW/cupswrapper/lpdwrapper ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_DCPL2660DW

  mkdir -p ${pkgdir}/opt/brother/Printers/DCPL2660DW/lpd/
  cp -r ${srcdir}/opt/brother/Printers/DCPL2660DW/inf ${pkgdir}/opt/brother/Printers/DCPL2660DW/
  cp ${srcdir}/opt/brother/Printers/DCPL2660DW/lpd/lpdfilter ${pkgdir}/opt/brother/Printers/DCPL2660DW/lpd/
  cp ${srcdir}/opt/brother/Printers/DCPL2660DW/lpd/${CARCH}/* ${pkgdir}/opt/brother/Printers/DCPL2660DW/lpd/
  cp -r ${srcdir}/var ${pkgdir}/
}
