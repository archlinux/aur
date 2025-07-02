#Maintainer: Rickey F <ric@rf3.xyz>
#Contributer(brother-dcpl2627dw repo): elParaguayo <elparaguayocode@gmail.com>

pkgname=brother-dcpl2640dw
pkgver=4.1.0_1
pkgrel=1
pkgdesc="Brother DCP-L2640DW lpr driver and CUPS wrapper"
arch=('i686' 'x86_64')
url="https://support.brother.com/g/b/downloadend.aspx?c=us&lang=en&prod=dcpl2640dw_us_as&os=127&dlid=dlf106025_000&flang=4&type3=10282"

license=('GPL2' 'custom:brother')
depends=('cups')
optdepends=(
  'brscan5: scanner support.'
  'brscan-skey: scanner key tool.'
)
source=(
  "https://download.brother.com/welcome/dlf106025/dcpl2640dwpdrv-${pkgver/_/-}.i386.rpm"
)
sha256sums=(
  '0b476e240296deeb0c8135ad0105233f6b93522fa3a4ae85088a175ed3463992'
)

prepare() {
  sed -i -e '75c\my $basedir = "/opt/brother/Printers/DCPL2640DW";' \
    ${srcdir}/opt/brother/Printers/DCPL2640DW/cupswrapper/lpdwrapper
}

package() {
  mkdir -p ${pkgdir}/usr/share/cups/model/Brother
  mkdir -p ${pkgdir}/usr/lib/cups/filter
  cp ${srcdir}/opt/brother/Printers/DCPL2640DW/cupswrapper/brother-DCPL2640DW-cups-en.ppd ${pkgdir}/usr/share/cups/model/Brother
  cp ${srcdir}/opt/brother/Printers/DCPL2640DW/cupswrapper/lpdwrapper ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_DCPL2640DW

  mkdir -p ${pkgdir}/opt/brother/Printers/DCPL2640DW/lpd/
  cp -r ${srcdir}/opt/brother/Printers/DCPL2640DW/inf ${pkgdir}/opt/brother/Printers/DCPL2640DW/
  cp ${srcdir}/opt/brother/Printers/DCPL2640DW/lpd/lpdfilter ${pkgdir}/opt/brother/Printers/DCPL2640DW/lpd/
  cp ${srcdir}/opt/brother/Printers/DCPL2640DW/lpd/${CARCH}/* ${pkgdir}/opt/brother/Printers/DCPL2640DW/lpd/
  cp -r ${srcdir}/var ${pkgdir}/
}

