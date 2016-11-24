# Maintainer: Maxwell Anselm <silverhammermba+aur@gmail.com>

pkgname=gcs
pkgver=4.6.0
pkgrel=1
pkgdesc="WYSIWYG editor for building character sheets for GURPS 4th Edition"
arch=('any')
url="http://gurpscharactersheet.com"
license=('MPL')
depends=('java-runtime=8')
source=(
	"http://gurpscharactersheet.com/downloads/$pkgver/$pkgname-$pkgver-linux.zip"
	'gcs.sh'
	'gcs.desktop'
	'gcs.xml'
)
sha256sums=(
	'ec33c9b725cf9ca08fddd8a95a6ac45bbc1b80b07897cc9e8a66e7f01ca03bac'
	'25042c6759fd814e23bf9139e6f6c5f93f67eec826f55825db052f4ff84ce241'
	'5b226260250972c1244f11be73c98bf43d3f30f428843c823c5a8a0ba01494ba'
	'cddee2d3b844dddd3a346a7c15c26f76019c875cccc03b0be34489c4dd71a320'
)

package() {
	pushd "$srcdir/$pkgname-$pkgver-linux"

	# jars
	install -d "$pkgdir/usr/share/java/gcs"
	find support/jars -name '*.jar' -execdir install -m644 {} "$pkgdir/usr/share/java/gcs" \;

	# library
	install -d "$pkgdir/usr/share/gcs"
	cp -dr --no-preserve=ownership Library "$pkgdir/usr/share/gcs"

	# icon
	install -d "$pkgdir/usr/share/icons/hicolor/128x128/apps"
	install -m644 support/gcs.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/gcs.png"

	popd

	# launcher
	install -Dm755 "$srcdir/gcs.sh" "$pkgdir/usr/bin/gcs"

	# MIME info
	install -d "$pkgdir/usr/share/mime/packages"
	install -m644 "$srcdir/gcs.xml" "$pkgdir/usr/share/mime/packages"

	# .desktop
	install -d "$pkgdir/usr/share/applications"
	install -m644 "$srcdir/gcs.desktop" "$pkgdir/usr/share/applications"

	# remove version from filename
	mv "$pkgdir/usr/share/java/gcs/gcs-${pkgver}.jar" "$pkgdir/usr/share/java/gcs/gcs.jar"
}
