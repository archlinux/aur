# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
# Based on PKGBUILD for iscan-plugin-gt-x770.

pkgname=iscan-plugin-gt-s600
pkgver=2.1.3
pkgrel=1
_bundlever=2.30.4
pkgdesc="iscan plugin for Epson Perfection V10."
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:AVASYS')
depends=('iscan')
install=gt-s600.install
source_x86_64=(https://download2.ebz.epson.net/iscan/plugin/gt-s600/rpm/x64/iscan-gt-s600-bundle-$_bundlever.x64.rpm.tar.gz)
source_i686=(https://download2.ebz.epson.net/iscan/plugin/gt-s600/rpm/x86/iscan-gt-s600-bundle-$_bundlever.x86.rpm.tar.gz)
sha1sums_x86_64=('87c602cbf7bc0550491fc0c107925d007dc8c012')
sha1sums_i686=('effac37aa3b91b6903079ad8bab68e6e293afbf2')

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
