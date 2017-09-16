# Maintainer: Tijn <t_ijn at yahoo dot com>
pkgname=brother-dcpl2540dn-cups
pkgver=3.2.0_1
pkgrel=1
pkgdesc="Brother DCP-L2540DN CUPS drivers."
arch=('any')
url="http://support.brother.com/g/b/downloadlist.aspx?c=nl&lang=nl&prod=dcpl2540dn_eu&os=127&flang=English"
license=('GPL2')
depends=('brother-dcpl2540dn-lpr' 'cups')
# optdepends=('brscan4: scanner support.')
source=("http://download.brother.com/welcome/dlf101762/dcpl2540dncupswrapper-${pkgver/_/-}.i386.rpm")
md5sums=('e1263b45814823fb2574fcfd06bfda1c')

prepare() {
  sed -ie '47,53c my $basedir = "/opt/brother/Printers/DCPL2540DN";' \
    ${srcdir}/opt/brother/Printers/DCPL2540DN/cupswrapper/brother_lpdwrapper_DCPL2540DN
}

package() {
  mkdir -p ${pkgdir}/usr/share/cups/model/Brother
  mkdir -p ${pkgdir}/usr/lib/cups/filter
  cp ${srcdir}/opt/brother/Printers/DCPL2540DN/cupswrapper/brother-DCPL2540DN-cups-en.ppd ${pkgdir}/usr/share/cups/model/Brother
  cp ${srcdir}/opt/brother/Printers/DCPL2540DN/cupswrapper/brother_lpdwrapper_DCPL2540DN ${pkgdir}/usr/lib/cups/filter
}
