# Maintainer: Charlotte Ausel <ettolrach@disroot.org>
# Adapted from <https://aur.archlinux.org/packages/brother-hll2402d>
pkgname=brother-hll2400dwe-bin
pkgver=4.1.0_1
pkgrel=1
pkgdesc="Brother HL-2400DWE CUPS Driver"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=gb&lang=en&prod=hll2400dwe_eu"
depends=("cups")
license=("custom:Brother")
source=("https://download.brother.com/welcome/dlf105950/hll2400dwepdrv-${pkgver//_/-}.i386.rpm")
sha256sums=("32a39889921e16a6ced555cd6b67b6abb91f8bb1da5a4b92d9db2c079a70f2ac")

_printer=HLL2400DWE

if [ "$CARCH" == "x86_64" ]
    then depends+=('lib32-glibc')
fi

package() {
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
