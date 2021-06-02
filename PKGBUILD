# Maintainer: Peter R <butforme@protonmail.com>

pkgname="brother-hl-l2370dw"
pkgver="4.0.0"
pkgrel=0
pkgdesc="LPR and CUPS driver for the Brother HL-L2370DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=hll2370dw_us"
license=("custom:brother commercial license")
depends=("cups" "ghostscript")
install='brother-hl-l2370dw.install'
source=(
	"https://download.brother.com/welcome/dlf103582/hll2370dwpdrv-4.0.0-1.i386.rpm"
	"cupswrapper-license.txt"
	"lpr-license.txt")
md5sums=(
	"7f6ea8f43d768fa22e8eb82171cdbd53"
	"5c5cbbdbef202917f8bf6e604a30bb7e"
	"5e87a3dc0f3e3438c088eda0f3565f0d")
if test "$CARCH" == x86_64; then
  depends+=('lib32-glibc')
fi

prepare() {
  install -d $srcdir/usr/share/cups/model
  install -d $srcdir/usr/lib/cups/filter
}

package() {
  cp -R $srcdir/usr $pkgdir
  cp -R $srcdir/opt $pkgdir

  ln -s /opt/brother/Printers/hll2370dw/cupswrapper/brother_hll3210cw_printer_en.ppd $pkgdir/usr/share/cups/model/brother_hll2370dw_printer_en.ppd
  ln -s /opt/brother/Printers/hll2370dw/cupswrapper/brother_lpdwrapper_hll2370dw $pkgdir/usr/lib/cups/filter/brother_lpdwrapper_hll2370dw

  install -m 644 -D cupswrapper-license.txt $pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt
  install -m 644 -D lpr-license.txt $pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt
}