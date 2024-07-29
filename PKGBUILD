# Maintainer: aquova <mail at aquova.net>

pkgname=brother-hll2405w
pkgver=4.1.0
pkgrel=1
pkgdesc="CUPS driver for the Brother HL-L2405W"
arch=('i686' 'x86_64')
url="https://brother.com"
license=('custom')
depends=('cups')
depends_x86_64=('lib32-glibc')

source=(
  "https://download.brother.com/welcome/dlf105954/hll2405wpdrv-${pkgver}-1.i386.rpm"
)
sha256sums=(
  'e5497bcdf1fc63e0700691b985b0817b1a34bef745f56202f85dfb6365f74647'
)

package() {
  cp -R "$srcdir/opt" "$pkgdir/opt"
  ln -s "/opt/brother/Printers/HLL2405W/lpd/$CARCH/rawtobr3" "$pkgdir/opt/brother/Printers/HLL2405W/lpd/rawtobr3"
  ln -s "/opt/brother/Printers/HLL2405W/lpd/$CARCH/brprintconflsr3" "$pkgdir/opt/brother/Printers/HLL2405W/lpd/brprintconflsr3"

  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/opt/brother/Printers/HLL2405W/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HLL2405W"

  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/opt/brother/Printers/HLL2405W/cupswrapper/brother-HLL2405W-cups-en.ppd" "$pkgdir/usr/share/cups/model"

  install -Dm644 "$srcdir/opt/brother/Printers/HLL2405W/LICENSE_ENG.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_ENG.txt"
  install -Dm644 "$srcdir/opt/brother/Printers/HLL2405W/LICENSE_JPN.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_JPN.txt"
}
