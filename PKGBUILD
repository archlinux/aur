# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=tscdriver
pkgver=0.2.06
pkgrel=5
pkgdesc="Drivers for TSC Printers"
arch=(x86_64)
url="http://www.tscprinters.com"
license=('custom:proprietary')
depends=(gtk2)
makedepends=(unzip)
source=("Linux64_v$pkgver.zip::$url/EN/DownloadFile/DownloadFileSupport/1103/3174")
md5sums=('ea523125745496cc2f0de0d8969b15e5')

prepare() {
  cd "$srcdir"
  tar xvf "$pkgname-$pkgver-$CARCH.tar.gz"
}

package() {
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
