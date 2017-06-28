# Maintainer: Patrik Karlsson <pata.karlsson@gmail.com>

pkgname=filebydate
pkgver=1.0.3
pkgrel=1
pkgdesc="date based file organizer"
arch=('any')
url="https://trixon.se/projects/java/filebydate/"
license=('Apache')
depends=('java-runtime=8')
makedepends=('desktop-file-utils')
source=(
	"https://trixon.se/files/$pkgname-$pkgver-bin.zip"
	'filebydate.sh'
	'filebydate.desktop'
)
sha256sums=(
	'353797eb62a2f72b807983dfdbf76604f45c01c7cdb956f595e31274830d861a'
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

