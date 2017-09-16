# Maintainer: Ian Glen <ian@ianglen.me>

pkgname="brother-hl5450dn"
pkgver="3.0.0"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother HL5450DN"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups')
source=(
  "http://www.brother.com/pub/bsc/linux/dlf/hl5450dnlpr-$pkgver-$pkgrel.i386.rpm"
  "http://www.brother.com/pub/bsc/linux/dlf/hl5450dncupswrapper-$pkgver-$pkgrel.i386.rpm"
  'cupswrapper-license.txt'
  'lpr-license.txt'
)
sha256sums=('31804b1cf9650e7d42108ed18f5e9808b53e173efa8978cb5db8f54c4fb595f8'
         'e0ad2394649acaf8bfd376b7388052dd6614b79442295936b703b7ebb5debc17'
         '2c6aa6a641332e5c87e971ac2a8beae13b059747bdba331bbd515914770d72d9'
         '9d85a8aafdaac8fac80e04234ad2acf5642bbf0b91ee582d2a89519a55f6dd67')
if test "$CARCH" == x86_64; then
  depends+=('lib32-glibc')
fi

package() {
    cp -R $srcdir/opt $pkgdir;
    install -m 644 -D $srcdir/opt/brother/Printers/HL5450DN/cupswrapper/brother-HL-5450DN-cups-en.ppd $pkgdir/usr/share/cups/model/brother-HL-5450DN-cups-en.ppd
    install -m 755 -D $srcdir/opt/brother/Printers/HL5450DN/cupswrapper/brother_lpdwrapper_HL5450DN $pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HL5450DN
    install -m 644 -D cupswrapper-license.txt $pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt
    install -m 644 -D lpr-license.txt $pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt
}