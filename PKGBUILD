# Maintainer: Andrew Schineller <andrew schineller at hotmail dot com>

pkgname=brother-dcpl5500dn
pkgver=3.5.1_1
pkgrel=1
pkgdesc="Brother DCP-L5500DN lpr driver and CUPS wrapper."
arch=('i686' 'x86_64')
url="https://support.brother.com/g/b/downloadend.aspx?c=us&lang=en&prod=dcpl5500dn_us_eu&os=127&dlid=dlf102575_000&flang=4&type3=558"
license=('GPL2' 'custom:brother')
depends=('cups')
optdepends=('brscan4: scanner support.')
source=(
  "https://download.brother.com/welcome/dlf102575/dcpl5500dnlpr-${pkgver/_/-}.i386.rpm"
  "https://download.brother.com/welcome/dlf102576/dcpl5500dncupswrapper-${pkgver/_/-}.i386.rpm")
md5sums=(
  '3bd492e0d9832c89ae327e5303bd6472'
  'ce72070c23dc3ab57171d8faba31d17f')

if test "$CARCH" == x86_64; then
  depends+=('lib32-glibc')
fi

prepare() {
  sed -i -e '47,53c my $basedir = "/opt/brother/Printers/DCPL5500DN";' \
    ${srcdir}/opt/brother/Printers/DCPL5500DN/cupswrapper/lpdwrapper
}

package() {
  mkdir -p ${pkgdir}/usr/share/cups/model/Brother
  mkdir -p ${pkgdir}/usr/lib/cups/filter
  cp ${srcdir}/opt/brother/Printers/DCPL5500DN/cupswrapper/brother-DCPL5500DN-cups-en.ppd ${pkgdir}/usr/share/cups/model/Brother
  cp ${srcdir}/opt/brother/Printers/DCPL5500DN/cupswrapper/lpdwrapper ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_DCPL5500DN

  mkdir -p ${pkgdir}/opt/brother/Printers/DCPL5500DN
  cp -r ${srcdir}/opt/brother/Printers/DCPL5500DN/inf ${pkgdir}/opt/brother/Printers/DCPL5500DN/
  cp -r ${srcdir}/opt/brother/Printers/DCPL5500DN/lpd ${pkgdir}/opt/brother/Printers/DCPL5500DN/
  cp -r ${srcdir}/var ${pkgdir}/
  cp -r ${srcdir}/etc ${pkgdir}/
}
