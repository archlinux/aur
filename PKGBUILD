# Maintainer: Cameron Matheson <cameron.matheson@gmail.com>

pkgname=brother-dcpl2540dw-cups
pkgver=3.2.0_1
pkgrel=4
pkgdesc="Brother DCP-L2540DW CUPS drivers."
arch=('i686' 'x86_64')
url="http://support.brother.com/g/b/downloadend.aspx?c=us&lang=en&prod=dcpl2540dw_us_as&os=127&dlid=dlf101716_000&flang=4&type3=560"
license=('GPL2' 'custom:brother')
depends=('brother-dcpl2540dw-lpr' 'cups')
optdepends=('brscan4: scanner support.')
source=("http://download.brother.com/welcome/dlf101716/dcpl2540dwcupswrapper-${pkgver/_/-}.i386.rpm")
md5sums=('5c91a139bc92684c7a454fb6bce010cd')

prepare() {
  sed -ie '47,53c my $basedir = "/opt/brother/Printers/DCPL2540DW";' \
    ${srcdir}/opt/brother/Printers/DCPL2540DW/cupswrapper/brother_lpdwrapper_DCPL2540DW

}

package() {
  mkdir -p ${pkgdir}/usr/share/cups/model/Brother
  mkdir -p ${pkgdir}/usr/lib/cups/filter
  cp ${srcdir}/opt/brother/Printers/DCPL2540DW/cupswrapper/brother-DCPL2540DW-cups-en.ppd ${pkgdir}/usr/share/cups/model/Brother
  cp ${srcdir}/opt/brother/Printers/DCPL2540DW/cupswrapper/brother_lpdwrapper_DCPL2540DW ${pkgdir}/usr/lib/cups/filter
}

