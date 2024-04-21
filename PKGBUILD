# Maintainer: Andrei Dobrete (andy3153 at protonmail dot com)

pkgname=brother-hll2402d
pkgver=4.1.0_1
pkgrel=1
pkgdesc="Brother HL-L2402D CUPS driver"
url="http://www.brother.com"
arch=('x86_64' 'i686')
depends=('cups')
license=('custom:Brother')
source=("https://download.brother.com/welcome/dlf105952/hll2402dpdrv-${pkgver//_/-}.i386.rpm")
sha256sums=("a8c4caf37273da667bbad8cd028316efd6ea222f9e491a9f4889905ae33422d5")

_printer=HLL2402D

if [ "$CARCH" == "x86_64" ]
  then depends+=('lib32-glibc')
fi

package()
{
  cp -R "${srcdir}/etc" "${pkgdir}/etc"
  cp -R "${srcdir}/opt" "${pkgdir}/opt"
  cp -R "${srcdir}/var" "${pkgdir}/var"

  ln -s "/opt/brother/Printers/${_printer}/lpd/${CARCH}/rawtobr3" "${pkgdir}/opt/brother/Printers/${_printer}/lpd/rawtobr3"
  ln -s "/opt/brother/Printers/${_printer}/lpd/${CARCH}/brprintconflsr3" "${pkgdir}/opt/brother/Printers/${_printer}/lpd/brprintconflsr3"

  install -d "${pkgdir}/usr/lib/cups/filter/"
  ln -s "/opt/brother/Printers/${_printer}/cupswrapper/lpdwrapper" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_${_printer}"

  install -d "${pkgdir}/usr/share/cups/model/"
  ln -s "/opt/brother/Printers/${_printer}/cupswrapper/brother-${_printer}-cups-en.ppd" "${pkgdir}/usr/share/cups/model"

  install -Dm644 "${srcdir}/opt/brother/Printers/${_printer}/LICENSE_ENG.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_ENG.txt"
  install -Dm644 "${srcdir}/opt/brother/Printers/${_printer}/LICENSE_JPN.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_JPN.txt"
}
