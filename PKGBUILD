# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
# Based on PKGBUILD for iscan-plugin-gt-x770.

pkgname=iscan-plugin-gt-s600
pkgver=2.1.3
pkgrel=2
_bundlever=2.30.4
pkgdesc="iscan plugin for Epson Perfection V10."
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:AVASYS')
depends=('iscan')
install=gt-s600.install
source_x86_64=(https://download2.ebz.epson.net/iscan/plugin/gt-s600/rpm/x64/iscan-gt-s600-bundle-$_bundlever.x64.rpm.tar.gz)
source_i686=(https://download2.ebz.epson.net/iscan/plugin/gt-s600/rpm/x86/iscan-gt-s600-bundle-$_bundlever.x86.rpm.tar.gz)
sha1sums_x86_64=('455e2c4733298c8a9120223ba67b4c9a8ee4cd75')
sha1sums_i686=('cf5064824334fd6ac9486527b4ff18ab34dc10bb')

package() {
  if [ "$CARCH" = "i686" ]
  then
    _arch=x86
  else
    _arch=x64
  fi

  cd "$srcdir"
  bsdtar -xf "iscan-gt-s600-bundle-$_bundlever.$_arch.rpm/plugins/$pkgname-${pkgver//_/-}-1.$CARCH.rpm"
  mv usr "$pkgdir"

  if [ "$CARCH" = "x86_64" ]
  then
    mv "$pkgdir"/usr/lib{64,}
  fi

  install -m 644 -D \
    "$pkgdir"/usr/share/doc/iscan-plugin-gt-s600-"$pkgver"/COPYING.EPSON.en.txt \
    "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
