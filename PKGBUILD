# Maintainer: Martin Schulze <spam.martin.schulze@gmx.de>
pkgname=passff-host-app
pkgver=1.0.0
pkgrel=1
pkgdesc="Systemwide installation of the passff firefox extension's host app"
arch=(any)
url="https://github.com/passff/passff/"
license=('GPL2')
conflicts=('firefox-passff-git' 'firefox-passff')
source=("https://github.com/passff/passff/releases/download/${pkgver}/passff.json"
	"https://github.com/passff/passff/releases/download/${pkgver}/passff.py")
sha256sums=('cd871bcf29d71e53f986fb74b7f2b1867151ba2b2a27318044c7bfaa38827282'
            'c4c8593077a40a8bb4f13890fcf099e284cc193743e60f645a7ed286efe1803a')

installdir=usr/lib/mozilla/native-messaging-hosts
APP_NAME=passff
HOST_FILE="${APP_NAME}.py"
MANIFEST_FILE="${APP_NAME}.json"
HOST_FILE_PATH="$installdir/${HOST_FILE}"

package() {
	cd $srcdir
	mkdir -p "$pkgdir/$installdir"
	cp "$HOST_FILE" "$MANIFEST_FILE" "$pkgdir/$installdir"
	cd "$pkgdir/$installdir"
	chmod a+x "$HOST_FILE"
	chmod o+r "$MANIFEST_FILE"
	ESCAPED_HOST_FILE_PATH="${HOST_FILE_PATH////\\/}"
	# don't forget to add the leading slash!
	sed -i -e "s/PLACEHOLDER/\/$ESCAPED_HOST_FILE_PATH/" "$MANIFEST_FILE"
}
