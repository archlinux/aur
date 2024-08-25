pkgname=brother-hll3240cdw-bin
pkgver=3.5.1
pkgrel=2
pkgdesc="LPR driver for Brother HL-L3240CDW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=gb&lang=en&prod=hll3240cdw_us_eu_as"
license=("GPL2")
depends=("cups" "perl")
source=("https://download.brother.com/welcome/dlf105734/hll3240cdwpdrv-$pkgver-1.i386.deb")
b2sums=('5203cf2dddba65e152842aa4ddf13602d1c303da5f07e97071f059e7c9bae481600ebb7697643d6d77b1bb815f85b07f62b5da4a6aff5f7587a8c137c0da1951')

prepare() {
  tar -xf data.tar.gz -C "$srcdir"
}

package() {
  cp -R "$srcdir/opt" "$pkgdir/opt"

  # symlink for lpdwrapper
  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/opt/brother/Printers/hll3240cdw/cupswrapper/brother_lpdwrapper_hll3240cdw" "$pkgdir/usr/lib/cups/filter/"

  # symlink for the PPD
  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/opt/brother/Printers/hll3240cdw/cupswrapper/brother_hll3240cdw_printer_en.ppd" "$pkgdir/usr/share/cups/model/"

  # architecture-specific symlinks
  ln -s "/opt/brother/Printers/hll3240cdw/lpd/$CARCH/brhll3240cdwfilter" "$pkgdir/opt/brother/Printers/hll3240cdw/lpd/"
  ln -s "/opt/brother/Printers/hll3240cdw/lpd/$CARCH/brprintconf_hll3240cdw" "$pkgdir/opt/brother/Printers/hll3240cdw/lpd/"
}
