# Maintainer: Felipe BF <fprgw32 at gmail dot com>

pkgname=brother-mfct930dw
pkgver=3.6.1
pkgrel=1
pkgdesc="LPR and CUPS driver for Brother MFC-T930DW"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="http://www.brother.com"
license=('custom:Brother')
depends=('cups' 'ghostscript' 'perl')
depends_x86_64=('lib32-glibc')

source=("https://download.brother.com/welcome/dlf106498/mfct930dwpdrv-${pkgver}-2.x86_64.rpm")
sha512sums=('d7f654b81342f7b7046445846036bb40fa149231dde6ea88c121c0dc8221e791aaad3786e8d5e42a2b6494e05fce10f344d308e67597b5ff54235d2816ca7466')

package() {
  # install to expected /opt path
  install -d "${pkgdir}/opt/brother/Printers/mfct930dw"
  cp -R "${srcdir}/opt/brother/Printers/mfct930dw/." \
    "${pkgdir}/opt/brother/Printers/mfct930dw/"

  # symlink cups filters
  install -d "${pkgdir}/usr/lib/cups/filter/"
  ln -sf "/opt/brother/Printers/mfct930dw/cupswrapper/brother_lpdwrapper_mfct930dw" \
    "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_mfct930dw"

  # symlink cups ppd files
  install -d "${pkgdir}/usr/share/cups/model/"
  ln -sf "/opt/brother/Printers/mfct930dw/cupswrapper/brother_mfct930dw_printer_en.ppd" \
    "${pkgdir}/usr/share/cups/model/brother_mfct930dw_printer_en.ppd"
  
  # symlink x86_64 filters
  ln -sf "/opt/brother/Printers/mfct930dw/lpd/x86_64/brmfct930dwfilter" \
    "${pkgdir}/opt/brother/Printers/mfct930dw/lpd/brmfct930dwfilter"
  ln -sf "/opt/brother/Printers/mfct930dw/lpd/x86_64/brprintconf_mfct930dw" \
    "${pkgdir}/opt/brother/Printers/mfct930dw/lpd/brprintconf_mfct930dw"
  
  # Install license files
  install -Dm644 "${pkgdir}/opt/brother/Printers/mfct930dw/LICENSE_ENG.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_ENG.txt"
  install -Dm644 "${pkgdir}/opt/brother/Printers/mfct930dw/LICENSE_JPN.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_JPN.txt"
}
