# Maintainer: grifs <grifoniantaure at gmail dot com>
pkgname=brother-mfc-l8390cdw
pkgver=3.5.1
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-L8390CDW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux"
license=('GPL2' 'custom:Brother EULA')
depends_x86_64=('lib32-glibc')
source=("https://download.brother.com/welcome/dlf105782/mfcl8390cdwpdrv-3.5.1-1.i386.rpm"
        setupPrintcapij.patch)
sha256sums=('ddc015aeeb681588c9926ce1ad4b4d6378557dc25d1216763341637c434a0a84'
            '98050f2292b1444e9bfe82943b736900f2cd5eef59ba49ecd4f08397a76fcfd6')
prepare() {
  cd ${srcdir}/opt/brother/Printers/mfcl8390cdw/inf
  patch < ${srcdir}/setupPrintcapij.patch
}
package() {
  mkdir -p ${pkgdir}/usr/share/cups/model/Brother
  mkdir -p ${pkgdir}/usr/share/ppd/Brother
  mkdir -p ${pkgdir}/usr/lib/cups/filter
  # install -Dm755 ${srcdir}/usr/bin/brprintconf_mfcl8390cdw ${pkgdir}/usr/bin/brprintconf_mfcl8390cdw
  install -Dm644 ${srcdir}/opt/brother/Printers/mfcl8390cdw/cupswrapper/brother_mfcl8390cdw_printer_en.ppd ${pkgdir}/usr/share/cups/model/Brother
  install -Dm644 ${srcdir}/opt/brother/Printers/mfcl8390cdw/cupswrapper/brother_mfcl8390cdw_printer_en.ppd ${pkgdir}/usr/share/ppd/Brother
  ln -s \
    /opt/brother/Printers/mfcl8390cdw/cupswrapper/brother_lpdwrapper_mfcl8390cdw \
    ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_mfcl8390cdw
  cp -r ${srcdir}/opt ${pkgdir}/opt
  ln -s \
    x86_64/brmfcl8390cdwfilter \
    ${pkgdir}/opt/brother/Printers/mfcl8390cdw/lpd/brmfcl8390cdwfilter
  ln -s \
    x86_64/brprintconf_mfcl8390cdw \
    ${pkgdir}/opt/brother/Printers/mfcl8390cdw/lpd/brprintconf_mfcl8390cdw
}
