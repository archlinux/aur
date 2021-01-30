# Maintainer: rafaelff <rafaelff@gnome.org>

pkgname=tscdriver
pkgver=1.2.02
pkgrel=1
pkgdesc="Drivers for TSC Printers"
arch=(x86_64)
url="https://www.tscprinters.com"
license=('custom:proprietary')
depends=(gtk2)
makedepends=(unzip)
source=("$pkgname-$pkgver.zip::$url/EN/DownloadFile/DownloadFileSupport/1110/Linux64_v$pkgver.zip?m_id=4124")
sha256sums=('381b0306b2bb6545d1019f99198a30841939d2deb2dcb3cda0c59d81ec185b3d')

package() {
  cd "barcodedriver-$pkgver"

  install -vdm755 "$pkgdir/usr/bin/"
  install -vm755 thermalprinterui               "$pkgdir/usr/bin/"
  install -vm4755 thermalprinterut              "$pkgdir/usr/bin/"

  install -vdm755 "$pkgdir/usr/lib/cups/backend/"
  install -vm755 backend/brusb                 "$pkgdir/usr/lib/cups/backend/"
  install -vm755 backend/brsocket              "$pkgdir/usr/lib/cups/backend/"
  
  install -vdm755 "$pkgdir/usr/lib/cups/filter/"
  install -vm755 rastertobarcodetspl            "$pkgdir/usr/lib/cups/filter/rastertobarcodetspl"

  install -vdm755 "$pkgdir/usr/share/cups/model/tsc-ppds/"
  install -vm644 ppd/*.ppd                      "$pkgdir/usr/share/cups/model/tsc-ppds/"

  install -vDm644 thermalprinterui.png          "$pkgdir/usr/share/icons/hicolor/128x128/apps/thermalprinterui.png"
  install -vDm644 barcodeprintersetting.desktop "$pkgdir/usr/share/applications/barcodeprintersetting.desktop"
  sed -i "$pkgdir/usr/share/applications/barcodeprintersetting.desktop" \
    -e 's/Exec=.*/Exec=thermalprinterui/;s/Icon=.*/Icon=thermalprinterui.png/'
}
