# Maintainer: Frederick Gnodtke <frederick@gnodtke.net>
pkgname=brother-mfc-l8690cdw
pkgver=1.2.0
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-L8690CDW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux"
license=('GPL2' 'custom:Brother EULA')
depends=('cups')
depends_x86_64=('lib32-glibc')
source=("http://download.brother.com/welcome/dlf103215/mfcl8690cdwlpr-1.2.0-0.i386.rpm"
        "http://download.brother.com/welcome/dlf103224/mfcl8690cdwcupswrapper-1.3.0-0.i386.rpm"
        setupPrintcapij.patch)
sha256sums=('863492ff815d7809dc03718a13efc5bc5c338ccacb3c9fef1985714687e5c7c9'
            '542d8ef11497a01e5d62a716f8b065ca05bc932f84696eab72698cef808d9759'
            'SKIP')

prepare() {
  cd ${srcdir}/opt/brother/Printers/mfcl8690cdw/inf
  patch < ${srcdir}/setupPrintcapij.patch
}

package() {
  mkdir -p ${pkgdir}/usr/share/cups/model/Brother
  mkdir -p ${pkgdir}/usr/share/ppd/Brother
  mkdir -p ${pkgdir}/usr/lib/cups/filter

  install -Dm755 ${srcdir}/usr/bin/brprintconf_mfcl8690cdw ${pkgdir}/usr/bin/brprintconf_mfcl8690cdw
  install -Dm644 ${srcdir}/opt/brother/Printers/mfcl8690cdw/cupswrapper/brother_mfcl8690cdw_printer_en.ppd ${pkgdir}/usr/share/cups/model/Brother
  install -Dm644 ${srcdir}/opt/brother/Printers/mfcl8690cdw/cupswrapper/brother_mfcl8690cdw_printer_en.ppd ${pkgdir}/usr/share/ppd/Brother

  ln -s \
    /opt/brother/Printers/mfcl8690cdw/cupswrapper/brother_lpdwrapper_mfcl8690cdw \
    ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_mfcl8690cdw

  cp -r ${srcdir}/opt ${pkgdir}/opt
}
