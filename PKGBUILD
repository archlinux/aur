# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
# Based on PKGBUILD for iscan-plugin-gt-x770.

pkgname=iscan-plugin-gt-s600
pkgver=2.1.2_1
pkgrel=4
pkgdesc="iscan plugin for Epson Perfection V10."
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:AVASYS')
depends=('iscan')
makedepends=('rpmextract')
install=gt-s600.install

if [ "$CARCH" = "x86_64" ]
then
	_arch=$CARCH
	md5sums=('9e36fd80b1f8ffa3f658b6a025d5e186')
	source=(http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/01/58/35/e7b4314a66167d0b48ef370bb428dd298482cef2/$pkgname-${pkgver//_/-}.$_arch.rpm)
else
	_arch=i386
	md5sums=('0a3a83dbbb2630c5e9453cc78983ab81')
	source=(http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/01/58/35/77bf4c0a885f42e920ab9dd0a4ef2404e8863425/$pkgname-${pkgver//_/-}.$_arch.rpm)
fi

build() {
	cd "$srcdir"
	rpmextract.sh "$pkgname-${pkgver//_/-}.$_arch.rpm"
	mv usr "$pkgdir"

	if [ "$CARCH" = "x86_64" ]
	then
		mv "$pkgdir"/usr/lib{64,}
	fi

	install -m 644 -D \
		"$pkgdir"/usr/share/doc/iscan-plugin-gt-s600-2.1.2/AVASYSPL.en.txt \
		"$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
