# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=epson-tm-series-driver
pkgver=2.0.3.0
_tmx_cups_pkgver=1.2.2-1
pkgrel=1
pkgdesc="TM Series Printer Driver for Linux"
arch=('x86_64') # if you want 32-bit, modify the PKGBUILD ;)
url="https://download.epson-biz.com/modules/pos/index.php?page=soft&pcat=3&scat=32"
depends=('libcups')
license=('custom')
# Download from https://download.epson-biz.com/modules/pos/index.php?page=single_soft&cid=5012&pcat=3&scat=32 , I can't get a direct download link
# If the link above is broken, go to https://download.epson-biz.com/modules/pos/index.php?page=soft&pcat=3&scat=32 and choose the "TM/BA Series Printer Driver for Linux" and flag this package out-of-date!
source=("local://tmx-cups-$pkgver.tar.gz")
md5sums=('d7c210bdbc15b94d8b2512756e15357e')

prepare() {
  cd $srcdir/tmx-cups/filter/
  ar vx tmx-cups_${_tmx_cups_pkgver}_amd64.deb
  tar -zxvf data.tar.gz
}

package() {
  cd $srcdir/tmx-cups/
  mkdir -p $pkgdir/usr/share/cups/model/
 
  cp ppd/* $pkgdir/usr/share/cups/model/
  cp -R filter/usr $pkgdir
}

# vim:set ts=2 sw=2 et:
