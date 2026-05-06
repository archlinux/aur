# Maintainer: Błażej Dymek <dymekblazej@outlook.com>
# Contributor: Swiatoslaw Bilalow <sbilalow@gmail.com>

pkgname=brother-dcpl2622dw
pkgver=4.1.0_2
pkgrel=1
pkgdesc="CUPS and LPR drivers for the Brother DCP-L2622DW"
arch=("x86_64" "i686")

url="https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=dcpl2622dw_eu"
license=('GPL-2.0-only' 'custom:Brother EULA')
depends=("cups")
optdepends=(
  'brscan5: scanner support.'
  'brscan-skey: scanner key tool.'
)

source=(
    "https://download.brother.com/welcome/dlf106013/dcpl2622dwpdrv-${pkgver/_/-}.i386.rpm"
)
sha256sums=(
    "b1f61b1ec7bec4d191329c5e33d303b9311e12093717ffbadb4c3a3e1cfdadb7"
)

prepare() {
  sed -i -e '75c\my $basedir = "/opt/brother/Printers/DCPL2622DW";' \
    ${srcdir}/opt/brother/Printers/DCPL2622DW/cupswrapper/lpdwrapper
}

package() {
  mkdir -p ${pkgdir}/usr/share/cups/model/Brother
  mkdir -p ${pkgdir}/usr/lib/cups/filter
  cp ${srcdir}/opt/brother/Printers/DCPL2622DW/cupswrapper/brother-DCPL2622DW-cups-en.ppd ${pkgdir}/usr/share/cups/model/Brother
  cp ${srcdir}/opt/brother/Printers/DCPL2622DW/cupswrapper/lpdwrapper ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_DCPL2622DW

  mkdir -p ${pkgdir}/opt/brother/Printers/DCPL2622DW/lpd/
  cp -r ${srcdir}/opt/brother/Printers/DCPL2622DW/inf ${pkgdir}/opt/brother/Printers/DCPL2622DW/
  cp ${srcdir}/opt/brother/Printers/DCPL2622DW/lpd/lpdfilter ${pkgdir}/opt/brother/Printers/DCPL2622DW/lpd/
  cp ${srcdir}/opt/brother/Printers/DCPL2622DW/lpd/${CARCH}/* ${pkgdir}/opt/brother/Printers/DCPL2622DW/lpd/
  cp -r ${srcdir}/var ${pkgdir}/
}
