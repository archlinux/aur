# Maintainer: Patrik Karlsson <pata.karlsson@gmail.com>

pkgname=filebydate
pkgver=1.0.0
pkgrel=1
pkgdesc="organize files depending on their file or exif dates"
arch=('any')
url="http://trixon.se/projects/java/filebydate/"
license=('Apache')
depends=('java-runtime=8')
makedepends=('desktop-file-utils')
source=(
	"http://trixon.se/files/$pkgname-$pkgver-bin.zip"
	'filebydate.sh'
	'filebydate.desktop'
)
sha256sums=(
	'cc820a03e9e3415e2326d2f971a6dad7f681b9bed654adaec8c3a61665f191e4'
	'c2597c42471798834798ddee7f9dcef7a0811b181b2f335699f131f2ccafeca0'
	'3fc348ada388e3dcb265a83837d3f264ff1ff1cc07973c42384d8cf928c2f2fd'
)

package() {
	pushd "$srcdir/$pkgname-$pkgver"

	# jars
	install -d "$pkgdir/usr/share/java/filebydate"
	find -name '*.jar' -execdir install -m644 {} "$pkgdir/usr/share/java/filebydate" \;

	# icon
	install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
	install -m644 filebydate.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/filebydate.png"

	popd

	# launchers
	install -Dm755 "$srcdir/filebydate.sh" "$pkgdir/usr/bin/filebydate"

	# .desktop
	desktop-file-install $pkgname.desktop --dir "$pkgdir/usr/share/applications/"

	# remove version from filename
	mv "$pkgdir/usr/share/java/filebydate/filebydate-${pkgver}.jar" "$pkgdir/usr/share/java/filebydate/filebydate.jar"
}

