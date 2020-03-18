# Maintainer: Luke Arms <luke@arms.to>

pkgname=brother-hll3230cdw
pkgver=1.0.2
pkgrel=2
pkgdesc="LPR and CUPS driver for the Brother HL-L3230CDW"
arch=('i686' 'x86_64')
url="https://support.brother.com/g/b/producttop.aspx?c=au&lang=en&prod=hll3230cdw_us_eu_as"
license=('EULA')
depends=('cups')
source=(
  "https://download.brother.com/welcome/dlf103944/hll3230cdwpdrv-1.0.2-0.i386.rpm"
  "cupswrapper-license.txt"
  "lpr-license.txt"
)
sha256sums=(
  '7dfbc1d2f3543e97ab7ad56b961e47df98c18347b76962408cc9b30b4e452e90'
  'b5a4b76681eaff3083362b5bee5efde9227ae93036b304ec17a2455b919ae304'
  '6021c519fa4da722e7d6c3d74941c26761a4e83705db62600710ffb9ed5a6470'
)
! [ "$CARCH" = 'x86_64' ] || depends+=('lib32-glibc')

package() {
  cp -pr "$srcdir"/{opt,usr} "$pkgdir"
  mkdir -p "$pkgdir/usr/lib/cups/filter"
  ln -s "/opt/brother/Printers/hll3230cdw/cupswrapper/brother_lpdwrapper_hll3230cdw" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_hll3230cdw"
  install -Dm 644 "$srcdir/opt/brother/Printers/hll3230cdw/cupswrapper/brother_hll3230cdw_printer_en.ppd" "$pkgdir/usr/share/cups/model/brother_hll3230cdw_printer_en.ppd"
  install -Dm 644 "cupswrapper-license.txt" "$pkgdir/usr/share/licenses/$pkgname/cupswrapper-licence.txt"
  install -Dm 644 "lpr-license.txt" "$pkgdir/usr/share/licenses/$pkgname/lpr-licence.txt"
}
