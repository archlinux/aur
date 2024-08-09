#Maintainer: elParaguayo <elparaguayocode@gmail.com>

pkgname=brother-dcpl2627dw
pkgver=4.1.0_1
pkgrel=1
pkgdesc="Brother DCP-L2627DW lpr driver and CUPS wrapper"
arch=('i686' 'x86_64')
url="https://support.brother.com/g/b/downloadend.aspx?c=gb&lang=en&prod=dcpl2627dw_eu&os=127&dlid=dlf106017_000&flang=4&type3=10282"

license=('GPL2' 'custom:brother')
depends=('cups')
optdepends=(
  'brscan5: scanner support.'
  'brscan-skey: scanner key tool.'
)
source=(
  "https://download.brother.com/welcome/dlf106017/dcpl2627dwpdrv-${pkgver/_/-}.i386.rpm"
)
sha256sums=(
  '35927e0fa68246ebc07c00ac59b4c6d5110dbcc9ff6adfb5e465932eeaa45b55'
)

prepare() {
  sed -i -e '75c\my $basedir = "/opt/brother/Printers/DCPL2627DW";' \
    ${srcdir}/opt/brother/Printers/DCPL2627DW/cupswrapper/lpdwrapper
}

package() {
  mkdir -p ${pkgdir}/usr/share/cups/model/Brother
  mkdir -p ${pkgdir}/usr/lib/cups/filter
  cp ${srcdir}/opt/brother/Printers/DCPL2627DW/cupswrapper/brother-DCPL2627DW-cups-en.ppd ${pkgdir}/usr/share/cups/model/Brother
  cp ${srcdir}/opt/brother/Printers/DCPL2627DW/cupswrapper/lpdwrapper ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_DCPL2627DW

  mkdir -p ${pkgdir}/opt/brother/Printers/DCPL2627DW/lpd/
  cp -r ${srcdir}/opt/brother/Printers/DCPL2627DW/inf ${pkgdir}/opt/brother/Printers/DCPL2627DW/
  cp ${srcdir}/opt/brother/Printers/DCPL2627DW/lpd/lpdfilter ${pkgdir}/opt/brother/Printers/DCPL2627DW/lpd/
  cp ${srcdir}/opt/brother/Printers/DCPL2627DW/lpd/${CARCH}/* ${pkgdir}/opt/brother/Printers/DCPL2627DW/lpd/
  cp -r ${srcdir}/var ${pkgdir}/
}

