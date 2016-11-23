# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
# Based on PKGBUILD for iscan-plugin-gt-x770.

pkgname=iscan-plugin-gt-s600
pkgver=2.1.2_1
pkgrel=7
_bundlever=1.0.0
pkgdesc="iscan plugin for Epson Perfection V10."
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:AVASYS')
depends=('iscan')
install=gt-s600.install
sha1sums_x86_64=('b73bf2890251639f7d75523765281e8ced92c2e9')
source_x86_64=(https://download2.ebz.epson.net/iscan/plugin/gt-s600/rpm/x64/iscan-gt-s600-bundle-$_bundlever.x64.rpm.tar.gz)
sha1sums_i686=('8afc7d3e0b2d88bcf247390ebc11db41188fc662')
source_i686=(https://download2.ebz.epson.net/iscan/plugin/gt-s600/rpm/x86/iscan-gt-s600-bundle-$_bundlever.x86.rpm.tar.gz)

package() {
	if [ "$CARCH" = "i686" ]
	then
		_arch=x86
		_arch_inner=i386
	else
		_arch=x64
		_arch_inner=x86_64
	fi

	cd "$srcdir"
	bsdtar -xf "iscan-gt-s600-bundle-$_bundlever.$_arch.rpm/plugins/$pkgname-${pkgver//_/-}.$_arch_inner.rpm"
	mv usr "$pkgdir"

	if [ "$CARCH" = "x86_64" ]
	then
		mv "$pkgdir"/usr/lib{64,}
	fi

	install -m 644 -D \
		"$pkgdir"/usr/share/doc/iscan-plugin-gt-s600-2.1.2/AVASYSPL.en.txt \
		"$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
