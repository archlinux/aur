# Maintainer: Weber Jiang <webster.jiang@gmail.com>
pkgname=brother-dcpl2535dw
pkgver=4.0.0_1
pkgrel=1
pkgdesc="Brother DCP-L2535DW driver"
arch=('i686' 'x86_64')
url="https://support.brother.com/g/b/producttop.aspx?lang=zh&c=cn&prod=dcpl2535dw_cn&cgi=m00112%2fzh%2fsrc%3dDEVICE"
license=('GPL2' 'custom:brother')
depends=('cups')
optdepends=('brscan4: scanner support.')
source=(
  "https://d.brother-movie.com/driver/286/dcpl2535dwpdrv-${pkgver/_/-}.i386.rpm"
)
md5sums=(
  'e62e2935da329aa2e3e22150fe84bfb8'
)

prepare() {
  sed -i -e '75c\my $basedir = "/opt/brother/Printers/DCPL2535DW";' \
    ${srcdir}/opt/brother/Printers/DCPL2535DW/cupswrapper/lpdwrapper
}

package() {
  mkdir -p ${pkgdir}/usr/share/cups/model/Brother
  mkdir -p ${pkgdir}/usr/lib/cups/filter
  cp ${srcdir}/opt/brother/Printers/DCPL2535DW/cupswrapper/brother-DCPL2535DW-cups-en.ppd ${pkgdir}/usr/share/cups/model/Brother
  cp ${srcdir}/opt/brother/Printers/DCPL2535DW/cupswrapper/lpdwrapper ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_DCPL2535DW

  mkdir -p ${pkgdir}/opt/brother/Printers/DCPL2535DW/lpd/
  cp -r ${srcdir}/opt/brother/Printers/DCPL2535DW/inf ${pkgdir}/opt/brother/Printers/DCPL2535DW/
  cp ${srcdir}/opt/brother/Printers/DCPL2535DW/lpd/lpdfilter ${pkgdir}/opt/brother/Printers/DCPL2535DW/lpd/
  cp ${srcdir}/opt/brother/Printers/DCPL2535DW/lpd/${CARCH}/* ${pkgdir}/opt/brother/Printers/DCPL2535DW/lpd/
  cp -r ${srcdir}/var ${pkgdir}/
}

