# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Nissar Chababy <funilrys at outlook dot com>

pkgname=brother-mfct920dw
pkgver=3.5.0
pkgrel=3
pkgdesc="LPR and CUPS driver for Brother MFC-T920DW"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="http://www.brother.com"
license=('custom:Brother')
depends=('cups' 'ghostscript' 'perl')
depends_x86_64=('lib32-glibc')
optdepends=('brscan5: scanning support')

source=("https://download.brother.com/welcome/dlf105186/mfct920dwpdrv-${pkgver}-3.i386.rpm")
sha512sums=('8df722d021223bfb295e2ca63dae51daf73b8746f6ba799a71a1463e364c4855da4fa8832e029e5635b93ce6d0e02991620670464e7ea424b1455d11345c9346')

package() {
  _basedir="/opt/brother/Printers/mfct920dw"
  
  # install to expected /opt path
  install -d "${pkgdir}${_basedir}"
  cp -R "${srcdir}${_basedir}/." "${pkgdir}${_basedir}/"

  # symlink cups filters
  install -d "${pkgdir}/usr/lib/cups/filter/"
  ln -sf "${_basedir}/cupswrapper/brother_lpdwrapper_mfct920dw" \
    "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_mfct920dw"

  # symlink cups ppd files
  install -d "${pkgdir}/usr/share/cups/model/"
  ln -sf "${_basedir}/cupswrapper/brother_mfct920dw_printer_en.ppd" \
    "${pkgdir}/usr/share/cups/model/brother_mfct920dw_printer_en.ppd"
  
  # symlink filters according to architecture
  ln -sf "${_basedir}/lpd/${CARCH}/brmfct920dwfilter" \
    "${pkgdir}${_basedir}/lpd/brmfct920dwfilter"
  ln -sf "${_basedir}/lpd/${CARCH}/brprintconf_mfct920dw" \
    "${pkgdir}${_basedir}/lpd/brprintconf_mfct920dw"
  
  # Install license files
  install -Dm644 "${pkgdir}${_basedir}/LICENSE_ENG.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_ENG.txt"
  install -Dm644 "${pkgdir}${_basedir}/LICENSE_JPN.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_JPN.txt"
}
