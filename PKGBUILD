# Maintainer: Reik Keutterling <spielkind@gmail.com>
# Adapted from brother-hl8350cdw by giulio
pkgname="brother-hl-l3270cdw"
pkgver="1.0.2"
pkgrel=0
pkgdesc="LPR and CUPS driver for the Brother HL-L3270CDW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups' 'ghostscript')
install='brother-hl-l3270cdw.install'
source=(
  "https://download.brother.com/welcome/dlf103945/hll3270cdwpdrv-1.0.2-0.i386.rpm"
  'cupswrapper-license.txt'
  'lpr-license.txt'
)
md5sums=('f45a7ed29d0509d0dcbb7a717bd07f2f'
         '97ad0cffd216059e9d1d3121899d8646'
         '5e87a3dc0f3e3438c088eda0f3565f0d')
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

  ln -s /opt/brother/Printers/hll3270cdw/cupswrapper/brother_hll3270cdw_printer_en.ppd $pkgdir/usr/share/cups/model/brother_hll3270cdw_printer_en.ppd
  ln -s /opt/brother/Printers/hll3270cdw/cupswrapper/brother_lpdwrapper_hll3270cdw $pkgdir/usr/lib/cups/filter/brother_lpdwrapper_hll3270cdw 

  install -m 644 -D cupswrapper-license.txt $pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt
  install -m 644 -D lpr-license.txt $pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt
}
