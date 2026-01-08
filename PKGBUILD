# Maintainer: Lunar King
# Based on brother-mfc-j432w by arbitar

pkgname="brother-mfc-j432w"
pkgver="1.0.0"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-J432W"
arch=('i686' 'x86_64')
url="https://support.brother.com/g/b/downloadtop.aspx?c=au&lang=en&prod=mfcj432w_as"
license=('custom' 'GPL2')
depends=('cups' 'ghostscript')
depends_x86_64=('lib32-glibc')
source=("https://download.brother.com/welcome/dlf006573/mfcj432wlpr-3.0.1-1.i386.rpm"
        "https://download.brother.com/welcome/dlf006575/mfcj432wcupswrapper-3.0.0-1.i386.rpm"
        'lpr-license.txt')
md5sums=('2135f3e28aa0ea6fa22124d62f20efa1'
         '5b21e59158c4566288402b68100c67d3'
         '8dfc0b8b0a8cdea5d989257e1946e877')

package() {
  cp -r --no-preserve=ownership usr opt "$pkgdir"

  # move the filter into the cups filter directory
  install -m 755 -D "$pkgdir"/opt/brother/Printers/mfcj432w/lpd/filtermfcj432w \
    "$pkgdir"/usr/lib/cups/filter/brother_lpdwrapper_mfcj432w

  # move the ppd into the cups model directory
  install -m 755 -D "$pkgdir"/opt/brother/Printers/mfcj432w/cupswrapper/brother_mfcj432w_printer_en.ppd \
    "$pkgdir"/usr/share/cups/model/brother_mfcj432w_printer_en.ppd

  install -m 644 -D lpr-license.txt "$pkgdir"/usr/share/licenses/${pkgname}/lpr-licence.txt
}
