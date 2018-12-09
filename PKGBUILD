#Maintainer: Robin van der Kuil <r.vanderkuil@gmail.com>

pkgname=brother-dcpl2550dn
pkgver=4.0.0_1
pkgrel=1
pkgdesc="Brother DCP-L2550DN lpr driver and CUPS wrapper"
arch=('i686' 'x86_64')
url="https://support.brother.com/g/b/downloadend.aspx?c=eu_ot&lang=en&prod=dcpl2550dn_eu&os=127&dlid=dlf103519_000&flang=4&type3=10282"
license=('GPL2' 'custom:brother')
depends=('cups')
optdepends=('brscan4: scanner support.')
source=(
  "https://download.brother.com/welcome/dlf103519/dcpl2550dnpdrv-${pkgver/_/-}.i386.rpm"
)
sha256sums=(
  '88a2aa9fa5e9b441166983a032cb5e63681d4956b3ee6b84a1f777f76065b575'
)

prepare() {
  sed -i -e '75c\my $basedir = "/opt/brother/Printers/DCPL2550DN";' \
    ${srcdir}/opt/brother/Printers/DCPL2550DN/cupswrapper/lpdwrapper
}

package() {
  mkdir -p ${pkgdir}/usr/share/cups/model/Brother
  mkdir -p ${pkgdir}/usr/lib/cups/filter
  cp ${srcdir}/opt/brother/Printers/DCPL2550DN/cupswrapper/brother-DCPL2550DN-cups-en.ppd ${pkgdir}/usr/share/cups/model/Brother
  cp ${srcdir}/opt/brother/Printers/DCPL2550DN/cupswrapper/lpdwrapper ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_DCPL2550DN

  mkdir -p ${pkgdir}/opt/brother/Printers/DCPL2550DN/lpd/
  cp -r ${srcdir}/opt/brother/Printers/DCPL2550DN/inf ${pkgdir}/opt/brother/Printers/DCPL2550DN/
  cp ${srcdir}/opt/brother/Printers/DCPL2550DN/lpd/lpdfilter ${pkgdir}/opt/brother/Printers/DCPL2550DN/lpd/
  cp ${srcdir}/opt/brother/Printers/DCPL2550DN/lpd/${CARCH}/* ${pkgdir}/opt/brother/Printers/DCPL2550DN/lpd/
  cp -r ${srcdir}/var ${pkgdir}/
}


