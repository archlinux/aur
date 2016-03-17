# Maintainer: superlex


# Based on Parabola GNU/Linux-libre iceweasel-libre PKGBUILD :

# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Márcio Silva <coadde@parabola.nu>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>
# Contributor: fauno <fauno@kiwwwi.com.ar>
# Contributor: Figue <ffigue@gmail.com>

_lang=it
_language=Italian
_url=https://ftp.mozilla.org/pub/mozilla.org/firefox/releases

pkgname=iceweasel-i18n-it
pkgver=45.0
pkgrel=1
pkgdesc="$_language language pack for Iceweasel"
arch=('any')
url="https://wiki.debian.org/it/Iceweasel"
license=('MPL' 'GPL')
depends=("iceweasel>=$pkgver")
makedepends=('unzip' 'zip')
source=("$_url/$pkgver/linux-$CARCH/xpi/$_lang.xpi"
		'brand.dtd'
		'brand.properties')

if [ "$CARCH" = "x86_64" ]; then
    sha512sums=('31b7591869781ed391c6d8bce5e4654f6c5bd7df1b445761ab8d5d3eeac70f9e921adcf0c396bf71a7523ddef30131cb3a30153662b50fcb661c255d79711d7e'
				'ce454355d904384381e35c390dbad634d617d17387debeb00b4e737a7b4fa665b94d40762a415236519b7a44f8b2066aeab9a50a34f1155c4b272e263ce19027'
           		'1148215c777fde594362393751e9ac3c1a0c2cf6c87e1bb48bdea6eafd35ab027e357357ee8bdef143fae78c01471561724fe33ee86453ae2f36db3be2f52829')
else
    sha512sums=('e03f95f3606cfdaee636ca6b20f4b783e5fd4c4694ea8054fad7080b6166a0101933bdf1507fef4928baf1f6e12c6021da3d6c00ec95d1620aea4714e46c8e12'
				'ce454355d904384381e35c390dbad634d617d17387debeb00b4e737a7b4fa665b94d40762a415236519b7a44f8b2066aeab9a50a34f1155c4b272e263ce19027'
          	 	'1148215c777fde594362393751e9ac3c1a0c2cf6c87e1bb48bdea6eafd35ab027e357357ee8bdef143fae78c01471561724fe33ee86453ae2f36db3be2f52829')
fi

package() {
	cd "$srcdir"
	rm "$_lang.xpi"
	install -vDm644 "$srcdir/brand.dtd" "$srcdir/browser/chrome/$_lang/locale/branding"
	rm "$srcdir/brand.dtd"
	install -vDm644 "$srcdir/brand.properties" "$srcdir/browser/chrome/$_lang/locale/branding"
	rm "$srcdir/brand.properties"
  
	sed -i -e 's/firefox/iceweasel/' "$srcdir/install.rdf"
	sed -i 's|Firefox|Iceweasel|
         ' "$srcdir/browser/chrome/$_lang/locale/$_lang/devtools/client/sourceeditor.properties" \
           "$srcdir/browser/chrome/$_lang/locale//$_lang/devtools/client/toolbox.dtd" \
           "$srcdir/browser/chrome/$_lang/locale/$_lang/devtools/client/webide.dtd" \
           "$srcdir/browser/chrome/$_lang/locale/$_lang/devtools/client/webide.properties"
	rm -rv "$srcdir/chrome/$_lang/locale/$_lang/global-platform"/{mac,win}

	zip -r "langpack-$_lang@iceweasel.mozilla.org.xpi" .
	install -vDm644 "langpack-$_lang@iceweasel.mozilla.org.xpi" "$pkgdir/usr/lib/iceweasel/browser/extensions/langpack-$_lang@iceweasel.mozilla.org.xpi"
}
