# 2020-08-26 20:22:08
# Created by Julien Tremblay McLellan, user:Jtm-lis, jtremc@gmail.com
# Maintained by Arbitar, user:arbitar, aur@arbi.in
# Contributed by user:loqs and user:eschwartz
# See forum thread https://bbs.archlinux.org/viewtopic.php?pid=1923012 // archived version - https://web.archive.org/save/https://bbs.archlinux.org/viewtopic.php?pid=1923012


pkgname="brother-mfc-j435w"
_printername=mfcj435w
pkgver="3.0.0.1"
_pkgver="3.0.0-1"
pkgrel=2
pkgdesc="LPR and CUPS driver for the Brother MFC-J435W"
arch=('i686' 'x86_64')
url="https://support.brother.com/g/b/downloadtop.aspx?c=us&lang=en&prod=mfcj435w_us"
license=('custom' 'GPL2')
depends=('cups' 'ghostscript')
depends_x86_64=('lib32-glibc')
source=("https://download.brother.com/welcome/dlf006577/${_printername}lpr-$_pkgver.i386.rpm"
        "https://download.brother.com/welcome/dlf006579/${_printername}cupswrapper-$_pkgver.i386.rpm"
        'lpr-license.txt')
md5sums=('f55e367cc318de268a74dee7a01292bc'
         '90c4c2214217b230d76888785c1e5f74'
         '8dfc0b8b0a8cdea5d989257e1946e877')

package() {
  cp -r --no-preserve=ownership usr opt "$pkgdir"

  # move the filter into the cups filter directory
  install -m 755 -D "$pkgdir"/opt/brother/Printers/mfcj435w/lpd/filtermfcj435w \
    "$pkgdir"/usr/lib/cups/filter/brother_lpdwrapper_mfcj435w

  # move the ppd into the cups model directory
  install -m 755 -D "$pkgdir"/opt/brother/Printers/mfcj435w/cupswrapper/brother_mfcj435w_printer_en.ppd \
    "$pkgdir"/usr/share/cups/model/brother_mfcj435w_printer_en.ppd

  install -m 644 -D lpr-license.txt "$pkgdir"/usr/share/licenses/${pkgname}/lpr-licence.txt
}