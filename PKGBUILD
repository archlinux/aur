# Maintainer: Peter Severin Rasmussen <git@petersr.com>
# Adapted from brother-hl-l3270cdw by Reik Keutterling
pkgname="brother-hl-l3210cw"
pkgver="1.0.2"
pkgrel=0
pkgdesc="LPR and CUPS driver for the Brother HL-L3210CW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups' 'ghostscript')
install='brother-hl-l3210cw.install'
source=(
  "https://download.brother.com/welcome/dlf103942/hll3210cwpdrv-1.0.2-0.i386.rpm"
  'cupswrapper-license.txt'
  'lpr-license.txt'
)
md5sums=('c7e3d57cda18be69914aad496be39223'
         'fccd5dbcf41e0c0f83cb2379749db498'
         'ad58e3184bdb0f8763f5ca98f2cf7e39')
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

  ln -s /opt/brother/Printers/hll3210cw/cupswrapper/brother_hll3210cw_printer_en.ppd $pkgdir/usr/share/cups/model/brother_hll3210cw_printer_en.ppd
  ln -s /opt/brother/Printers/hll3210cw/cupswrapper/brother_lpdwrapper_hll3210cw $pkgdir/usr/lib/cups/filter/brother_lpdwrapper_hll3210cw

  install -m 644 -D cupswrapper-license.txt $pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt
  install -m 644 -D lpr-license.txt $pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt
}

