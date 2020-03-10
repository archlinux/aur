# Maintainer: Rob Agnese <ragnese@protonmail.com>
# Adapted from brother-hl-l3270cdw by Reik Keutterlin <spielking@gmail.com>
# Adapted from brother-hl8350cdw by giulio
pkgname="brother-hl-l3290cdw"
pkgver="1.0.2"
pkgrel=0
pkgdesc="LPR and CUPS driver for the Brother HL-L3290CDW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups' 'ghostscript' 'perl')
install='brother-hl-l3290cdw.install'
source=(
  "https://download.brother.com/welcome/dlf103946/hll3290cdwpdrv-1.0.2-0.i386.rpm"
  'cupswrapper-license.txt'
  'lpr-license.txt'
)
md5sums=('ed55e7f9d9a90f71e1b05b8b8ceb5934'
         '7c93206cd9095a9659d750bc8b2b804c'
         'bf894a1a51baf6055a6c58ecf43c9782')
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

  ln -s /opt/brother/Printers/hll3290cdw/cupswrapper/brother_hll3290cdw_printer_en.ppd $pkgdir/usr/share/cups/model/
  ln -s /opt/brother/Printers/hll3290cdw/cupswrapper/brother_lpdwrapper_hll3290cdw $pkgdir/usr/lib/cups/filter/

  install -m 644 -D cupswrapper-license.txt $pkgdir/usr/share/licenses/${pkgname}/cupswrapper-license.txt
  install -m 644 -D lpr-license.txt $pkgdir/usr/share/licenses/${pkgname}/lpr-license.txt
  ln -s /opt/brother/Printers/hll3290cdw/LICENSE_ENG.txt $pkgdir/usr/share/licenses/${pkgname}/
  ln -s /opt/brother/Printers/hll3290cdw/LICENSE_JPN.txt $pkgdir/usr/share/licenses/${pkgname}/
}

