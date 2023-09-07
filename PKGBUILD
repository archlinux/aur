# Maintainer: Rokic <Rokicc@proton.me>
# Based on brother-dcpl2530dw package from AUR.

pkgname=brother-dcpl2510d
pkgver=4.0.0_1
pkgrel=1
pkgdesc="LPR driver and CUPS wrapper for the Brother DCP-L2510D and DCP-L2512D printers"
arch=('i686' 'x86_64')
url="https://support.brother.com/g/b/downloadtop.aspx?c=eu_ot&lang=en&prod=dcpl2512d_eu"
license=('GPL2' 'custom:brother')
depends=('cups')
optdepends=('brscan4: scanner support.')
source=(
  "http://download.brother.com/welcome/dlf103515/dcpl2510dpdrv-${pkgver/_/-}.i386.rpm"
)
md5sums=(
  'd893177416b0da4ccaaadf3278b9d298'
)

prepare() {
  sed -i -e '75c\my $basedir = "/opt/brother/Printers/DCPL2510D";' \
    ${srcdir}/opt/brother/Printers/DCPL2510D/cupswrapper/lpdwrapper
}

package() {
  mkdir -p ${pkgdir}/usr/share/cups/model/Brother
  mkdir -p ${pkgdir}/usr/lib/cups/filter
  cp ${srcdir}/opt/brother/Printers/DCPL2510D/cupswrapper/brother-DCPL2510D-cups-en.ppd ${pkgdir}/usr/share/cups/model/Brother
  cp ${srcdir}/opt/brother/Printers/DCPL2510D/cupswrapper/lpdwrapper ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_DCPL2510D

  mkdir -p ${pkgdir}/opt/brother/Printers/DCPL2510D/lpd/
  cp -r ${srcdir}/opt/brother/Printers/DCPL2510D/inf ${pkgdir}/opt/brother/Printers/DCPL2510D/
  cp ${srcdir}/opt/brother/Printers/DCPL2510D/lpd/lpdfilter ${pkgdir}/opt/brother/Printers/DCPL2510D/lpd/
  cp ${srcdir}/opt/brother/Printers/DCPL2510D/lpd/${CARCH}/* ${pkgdir}/opt/brother/Printers/DCPL2510D/lpd/
  cp -r ${srcdir}/var ${pkgdir}/
}
