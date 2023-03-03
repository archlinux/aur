# Maintainer: Frederick Gnodtke <frederick@gnodtke.net>
pkgname=brother-mfc-l8690cdw
pkgver=1.5.0
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-L8690CDW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux"
license=('GPL2' 'custom:Brother EULA')
depends_x86_64=('lib32-glibc')
source=("http://download.brother.com/welcome/dlf103215/mfcl8690cdwlpr-${pkgver}-0.i386.rpm"
        "http://download.brother.com/welcome/dlf103224/mfcl8690cdwcupswrapper-${pkgver}-0.i386.rpm"
        setupPrintcapij.patch)
sha256sums=('45d9ccecff24dda6263cc43b692d92c1211d19a50bb3b4fd54466f789f904337'
            '8e8a84d6a8afc00ab9592480d87d546b3d22cd6388d2ca0cf28ad44883c468a5'
            '98050f2292b1444e9bfe82943b736900f2cd5eef59ba49ecd4f08397a76fcfd6')
prepare() {
  cd ${srcdir}/opt/brother/Printers/mfcl8690cdw/inf
  patch < ${srcdir}/setupPrintcapij.patch
}
package() {
  mkdir -p ${pkgdir}/usr/share/cups/model/Brother
  mkdir -p ${pkgdir}/usr/share/ppd/Brother
  mkdir -p ${pkgdir}/usr/lib/cups/filter
  # install -Dm755 ${srcdir}/usr/bin/brprintconf_mfcl8690cdw ${pkgdir}/usr/bin/brprintconf_mfcl8690cdw
  install -Dm644 ${srcdir}/opt/brother/Printers/mfcl8690cdw/cupswrapper/brother_mfcl8690cdw_printer_en.ppd ${pkgdir}/usr/share/cups/model/Brother
  install -Dm644 ${srcdir}/opt/brother/Printers/mfcl8690cdw/cupswrapper/brother_mfcl8690cdw_printer_en.ppd ${pkgdir}/usr/share/ppd/Brother
  ln -s \
    /opt/brother/Printers/mfcl8690cdw/cupswrapper/brother_lpdwrapper_mfcl8690cdw \
    ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_mfcl8690cdw
  cp -r ${srcdir}/opt ${pkgdir}/opt
}
