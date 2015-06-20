# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=tscdriver
pkgver=0.2.06
pkgrel=3
pkgdesc="Drivers for TSC Printers"
arch=(i686 x86_64)
url="http://www.tscprinters.com"
license=('GPL')
depends=(gtk2)
makedepends=(unzip)
install=$pkgname.install
source_i686=($url/cms/upload/download_en/Linux32_v$pkgver.zip)
source_x86_64=($url/cms/upload/download_en/Linux64_v$pkgver.zip)
md5sums_i686=(51b1d2b9e657307b3d7c687effe311e2)
md5sums_x86_64=(ea523125745496cc2f0de0d8969b15e5)

package() {
  cd "$srcdir"
  tar xvf "$pkgname-$pkgver-$CARCH.tar.gz"
  
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/cups/model/tsc-ppds/"
  install -m644 ppd/*.ppd "$pkgdir/usr/share/cups/model/tsc-ppds/"
  install -Dm755 rastertotspl "$pkgdir/usr/lib/cups/filter/rastertotspl"
  install -Dm755 thermalprinterui "$pkgdir/usr/bin/thermalprinterui"
  install -m4755 thermalprinterut "$pkgdir/usr/bin/thermalprinterut"
  install -Dm644 thermalprinterui.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/thermalprinterui.png"
  install -Dm644 tscprintersetting.desktop "$pkgdir/usr/share/applications/tscprintersetting.desktop"
  sed -i "$pkgdir/usr/share/applications/tscprintersetting.desktop" \
    -e 's/Exec=.*/Exec=thermalprinterui/;s/Icon=.*/Icon=thermalprinterui.png/'
}
