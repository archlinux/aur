# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=xerox-workcentre-78xx
pkgver=5.482.0.0
pkgrel=2
pkgdesc="Xerox WorkCentre 7830/7835/7845/7855 printer driver for CUPS"
arch=('i686' 'x86_64')
url="http://www.support.xerox.com/support/workcentre-7800-series/downloads/enus.html?associatedProduct=WorkCentre-78xx-built-in+controller&operatingSystem=linux"
license=('custom')
makedepends=('unrar')
source=("$pkgname.exe::http://download.support.xerox.com/pub/drivers/WC780XI/drivers/win10/ar/WC78XX_${pkgver}_PPD_English.exe"
        "LICENSE.txt"
        "0001-auto-tray.patch"
        "0002-color-option.patch")
sha256sums=('75ab5388dfe513732bd05cbaeb47196345ae26886d59c7d96b92749b6de08f9a'
            '2389b75bf45ba6f1329ad236110d7e1d496308cc484ee87b93c998a2573fd45b'
            '29392c8ba7f84b6b6e283089175d90606f2ef9d8c236dd1a310b9d1738c6ff0c'
            'ab1a4eeb26b93536dd4c88b365663d49c886b67e32680a8611d89d37b78e0d62')

prepare() {
  unrar x "$pkgname.exe"
  # Add new auto setting to "Paper Tray"
  patch -p1 -i 0001-auto-tray.patch
  # Add grayscale/color printing option
  patch -p1 -i 0002-color-option.patch
}

package() {
  install -Dm644 "xrx7830.ppd" "${pkgdir}/usr/share/ppd/xerox/xrx7830.ppd"
  install -Dm644 "xrx7835.ppd" "${pkgdir}/usr/share/ppd/xerox/xrx7835.ppd"
  install -Dm644 "xrx7845.ppd" "${pkgdir}/usr/share/ppd/xerox/xrx7845.ppd"
  install -Dm644 "xrx7855.ppd" "${pkgdir}/usr/share/ppd/xerox/xrx7855.ppd"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/xerox-workcentre-78xx/LICENSE.txt"
}
