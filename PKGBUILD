# Maintainer: Stephen R. Martin <stephensrmmartin@gmail.com>
# Adapted from brother-hl8350cdw by giulio
# Adapted from brother-hl-l3270cdw by michael.manley
pkgname="brother-hl-l3300cdw"
pkgver="3.5.1"
pkgrel=0
pkgdesc="LPR and CUPS driver for the Brother HL-L3300CDW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups' 'ghostscript')
install='brother-hl-l3300cdw.install'
source=(
  "https://download.brother.com/welcome/dlf105774/hll3300cdwpdrv-${pkgver}-1.i386.rpm"
  'cupswrapper-license.txt'
  'lpr-license.txt'
)
md5sums=('bcfa5798af170a05e94a5787c500bb9c'
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

  ln -s /opt/brother/Printers/hll3300cdw/cupswrapper/brother_hll3300cdw_printer_en.ppd $pkgdir/usr/share/cups/model/brother_hll3300cdw_printer_en.ppd
  ln -s /opt/brother/Printers/hll3300cdw/cupswrapper/brother_lpdwrapper_hll3300cdw $pkgdir/usr/lib/cups/filter/brother_lpdwrapper_hll3300cdw 

  install -m 644 -D cupswrapper-license.txt $pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt
  install -m 644 -D lpr-license.txt $pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt
}
