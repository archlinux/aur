# Maintainer: Sung Mingi <FiestaLake@protonmail.com>

pkgname=brother-hll3210cw
pkgver=1.0.2
pkgrel=1
pkgdesc="LPD and CUPS driver for the Brother HL-L3210cw."
arch=('i686' 'x86_64')
url="https://support.brother.com/g/b/downloadtop.aspx?c=us&lang=en&prod=hll3210cw_us_eu_as"
license=('EULA')
depends=('cups')
source=(
  "https://download.brother.com/welcome/dlf103942/hll3210cwpdrv-1.0.2-0.i386.rpm"
)
sha256sums=('8c8af0165852ea37341cc4f6c886191faefd64386d6567365f7e1b178d42bdc0')
! [ "$CARCH" = 'x86_64' ] || depends+=('lib32-glibc')

package() {
  cp -pr "$srcdir"/{opt,usr} "$pkgdir"
  mkdir -p "$pkgdir/usr/lib/cups/filter"
  ln -s "/opt/brother/Printers/hll3210cw/cupswrapper/brother_lpdwrapper_hll3210cw" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_hll3210cw"
  install -Dm 644 "$srcdir/opt/brother/Printers/hll3210cw/cupswrapper/brother_hll3210cw_printer_en.ppd" "$pkgdir/usr/share/cups/model/brother_hll3210cw_printer_en.ppd"
}
