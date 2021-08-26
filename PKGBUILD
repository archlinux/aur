# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Vain <aurmaint1 on host: uninformativ dot de>
# Based on PKGBUILD for iscan-plugin-gt-x770.

pkgname=epson-perfection-v10-v100-scanner-driver-aio
pkgver=2.30.4
pkgrel=1
_iscan=2.30.4-2
_iscan_data=1.39.2-1
_plugin=2.1.3-1
pkgdesc="Perfection V10/V100 Scanner Driver	for Linux. All-in-one package with iscan and drivers"
arch=('x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:AVASYS')
install=gt-s600.install
provides=("iscan" "iscan-for-epson-v500-photo" "iscan-plugin-gt-s600")
conflicts=("iscan" "iscan-for-epson-v500-photo" "iscan-plugin-gt-s600")
source=("https://download2.ebz.epson.net/iscan/plugin/gt-s600/rpm/x64/iscan-gt-s600-bundle-${pkgver}.x64.rpm.tar.gz" epkowa.conf)
sha256sums=('fe1356b1d5c40bc5ac985a5693166efb9e5049a78b412f49c385eb503eadf2c6'
            'bdf3a9cf12f3f5c1ab2daceb801a4e334490a645a95eb5b7ec69cdc59e55a0e0')

package() {
  cd "$srcdir"
  bsdtar -xf "iscan-gt-s600-bundle-${pkgver}.x64.rpm/core/iscan-${_iscan}.${CARCH}.rpm"
  bsdtar -xf "iscan-gt-s600-bundle-${pkgver}.x64.rpm/data/iscan-data-${_iscan_data}.noarch.rpm"
  bsdtar -xf "iscan-gt-s600-bundle-${pkgver}.x64.rpm/plugins/iscan-plugin-gt-s600-${_plugin}.${CARCH}.rpm"
  mv usr "$pkgdir"

  mv -v "$pkgdir"/usr/lib64/* "$pkgdir"/usr/lib/
  rmdir "$pkgdir"/usr/lib64
  mv -v "$pkgdir"/usr/sbin/* "$pkgdir"/usr/bin
  rmdir "$pkgdir"/usr/sbin

  install -m 644 -D ../epkowa.conf "$pkgdir"/etc/sane.d/epkowa.conf

  install -m 644 -D \
    "$pkgdir"/usr/share/doc/iscan-plugin-gt-s600-${_plugin%-*}/COPYING.EPSON.en.txt \
    "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
