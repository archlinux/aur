#Maintainer: Michele Schäuble <michele.schaeuble@gmail.com>

pkgname=brother-dcpl2530dw
pkgver=4.0.0_1
pkgrel=1
pkgdesc="Brother DCP-L2530DW driver"
arch=('i686' 'x86_64')
url="http://support.brother.com/g/b/downloadend.aspx?c=us&lang=en&prod=dcpl2520dw_us_eu&os=127&dlid=dlf101757_000&flang=4&type3=558"
license=('GPL2' 'custom:brother')
depends=('cups')
optdepends=('brscan4: scanner support.')
source=(
  "http://download.brother.com/welcome/dlf103517/dcpl2530dwpdrv-${pkgver/_/-}.i386.rpm"
)
md5sums=(
  'a8f84171ee1796fc4899579d92df0e24'
)

prepare() {
  sed -i -e '75c\my $basedir = "/opt/brother/Printers/DCPL2530DW";' \
    ${srcdir}/opt/brother/Printers/DCPL2530DW/cupswrapper/lpdwrapper
}

package() {
  mkdir -p ${pkgdir}/usr/share/cups/model/Brother
  mkdir -p ${pkgdir}/usr/lib/cups/filter
  cp ${srcdir}/opt/brother/Printers/DCPL2530DW/cupswrapper/brother-DCPL2530DW-cups-en.ppd ${pkgdir}/usr/share/cups/model/Brother
  cp ${srcdir}/opt/brother/Printers/DCPL2530DW/cupswrapper/lpdwrapper ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_DCPL2530DW

  mkdir -p ${pkgdir}/opt/brother/Printers/DCPL2530DW/lpd/
  cp -r ${srcdir}/opt/brother/Printers/DCPL2530DW/inf ${pkgdir}/opt/brother/Printers/DCPL2530DW/
  cp ${srcdir}/opt/brother/Printers/DCPL2530DW/lpd/lpdfilter ${pkgdir}/opt/brother/Printers/DCPL2530DW/lpd/
  cp ${srcdir}/opt/brother/Printers/DCPL2530DW/lpd/${CARCH}/* ${pkgdir}/opt/brother/Printers/DCPL2530DW/lpd/
  cp -r ${srcdir}/var ${pkgdir}/
}
