# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=tscdriver
pkgver=0.2.06
pkgrel=6
pkgdesc="Drivers for TSC Printers"
arch=(x86_64)
url="http://www.tscprinters.com"
license=('custom:proprietary')
depends=(gtk2)
makedepends=(unzip)
source=("$pkgname-$pkgver.zip::$url/EN/DownloadFile/DownloadFileSupport/1103/Linux64_v$pkgver.zip?m_id=3174")
sha256sums=('ae0055600947b648a0843727fecef440ef573ec0937d178684d9ebe34076a6b2')

prepare() {
  tar xvf "Linux64_v$pkgver/$pkgname-$pkgver-$CARCH.tar.gz"
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
