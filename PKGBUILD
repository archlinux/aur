# Maintainer: Frederick Gnodtke <frederick@gnodtke.net>
pkgname=brother-mfc-l8690cdw
pkgver=1.3.0
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-L8690CDW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux"
license=('GPL2' 'custom:Brother EULA')
depends_x86_64=('lib32-glibc')
source=("http://download.brother.com/welcome/dlf103215/mfcl8690cdwlpr-${pkgver}-0.i386.rpm"
        "http://download.brother.com/welcome/dlf103224/mfcl8690cdwcupswrapper-1.4.0-0.i386.rpm"
        setupPrintcapij.patch)
sha256sums=('346fe7a66046002dcda9f42be6cd7fef60cb63905a69c5d0ac0c14c115a0467e'
            '6f03eb6aa7483a5981552ac6604af436d8f257a26fa3b1c40b619d02cfae04b5'
            '98050f2292b1444e9bfe82943b736900f2cd5eef59ba49ecd4f08397a76fcfd6')
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