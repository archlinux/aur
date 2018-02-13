# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=xerox-workcentre-72xx
pkgver=5.482.0.0
pkgrel=2
pkgdesc="Xerox WorkCentre 7220/7225 printer driver for CUPS"
arch=('i686' 'x86_64')
url="http://www.support.xerox.com/support/workcentre-7220-7225/file-download/enus.html?operatingSystem=winxp&fileLanguage=en&contentId=133852&from=downloads&viewArchived=false"
license=('custom')
makedepends=('unrar')
source=("$pkgname.exe::http://download.support.xerox.com/pub/drivers/WC7220_WC7225/drivers/win10/en_GB/WC72XX_${pkgver}_PPD_en-US.exe"
        "LICENSE.txt"
	"0001-color-option.patch"
	"0002-auto-tray.patch")
sha256sums=('0b8d1421212ce62669f3da449c049b11878da227e84ebb809dcf3dc32e5157ee'
            'd0eedafe4aeae9bff7218085eff9315ce25e6a39b3e6ebdd0fdebf7fb1440e31'
            'abe7f947884638e00c4f4263b73ed7c57769bf25bbd67cb519abc54ac98320f7'
            'f3720e2d6ecc43230308e161a9fbd6185d895e1e86dcc368e7a62c144c43f471')

prepare() {
  unrar x "$pkgname.exe"
  patch -p1 -i 0001-color-option.patch
  patch -p1 -i 0002-auto-tray.patch
}

package() {
  install -Dm644 "xrx7220.ppd" "${pkgdir}/usr/share/ppd/xerox/xrx7220.ppd"
  install -Dm644 "xrx7225.ppd" "${pkgdir}/usr/share/ppd/xerox/xrx7225.ppd"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/xerox-workcentre-72xx/LICENSE.txt"
}
