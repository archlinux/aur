pkgname=brother-dcpt830dw
pkgver=3.6.1
pkgrel=2
pkgdesc="LPR and CUPS driver for Brother DCP-T830DW"
arch=('x86_64')
url="https://support.brother.com/g/b/producttop.aspx?c=ae&lang=en&prod=dcpt830dw_all"
license=('custom:Brother' 'GPL')
depends=('cups' 'gcc-libs' 'ghostscript' 'glibc' 'perl')
optdepends=('brscan5: SANE scanner driver support'
            'brscan-skey: scan-key support from the device panel'
            'sane-airscan: driverless eSCL/WSD scanner support')
options=('!strip' '!debug')
source=("https://download.brother.com/welcome/dlf106494/dcpt830dwpdrv-${pkgver}-${pkgrel}.x86_64.rpm")
sha256sums=('233f9b1dfc1c6ae0304407d4fb43314a99c34637ba5170930d4d1045e9006398')

package() {
  local _basedir="/opt/brother/Printers/dcpt830dw"

  install -d "${pkgdir}${_basedir}"
  cp -R "${srcdir}${_basedir}/." "${pkgdir}${_basedir}/"
  rm -rf "${pkgdir}${_basedir}/lpd/i686"

  install -d "${pkgdir}/usr/lib/cups/filter"
  ln -sf "${_basedir}/cupswrapper/brother_lpdwrapper_dcpt830dw" \
    "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_dcpt830dw"

  install -d "${pkgdir}/usr/share/cups/model/Brother"
  ln -sf "${_basedir}/cupswrapper/brother_dcpt830dw_printer_en.ppd" \
    "${pkgdir}/usr/share/cups/model/Brother/brother_dcpt830dw_printer_en.ppd"

  ln -sf "${_basedir}/lpd/x86_64/brdcpt830dwfilter" \
    "${pkgdir}${_basedir}/lpd/brdcpt830dwfilter"
  ln -sf "${_basedir}/lpd/x86_64/brprintconf_dcpt830dw" \
    "${pkgdir}${_basedir}/lpd/brprintconf_dcpt830dw"

  install -d "${pkgdir}/usr/bin"
  ln -sf "${_basedir}/lpd/brprintconf_dcpt830dw" \
    "${pkgdir}/usr/bin/brprintconf_dcpt830dw"

  install -Dm644 "${pkgdir}${_basedir}/LICENSE_ENG.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_ENG.txt"
  install -Dm644 "${pkgdir}${_basedir}/LICENSE_JPN.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_JPN.txt"
}
