# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='mongodb-compass-beta'
_edition=' Beta'
pkgname="$_pkgname-bin"
_pkgver='1.20.0-beta.9'
pkgver="$(printf '%s' "$_pkgver" | tr '-' '.')"
pkgrel='4'
pkgdesc='The official GUI for MongoDB - beta version - binary version'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom:SSPL')
depends=('krb5' 'libsecret')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver-$pkgrel.rpm::https://github.com/mongodb-js/compass/releases/download/v$_pkgver/$_pkgname-$_pkgver.x86_64.rpm")
sha256sums=('2b520b7df6217104f61095ede87221b7925b4f09c415ef63db4d4b4bf0a026ac')

package() {
	cd "$srcdir/"

	install -dm755 "$pkgdir/opt/"
	cp -r --no-preserve=ownership --preserve=mode "usr/share/$_pkgname/" "$pkgdir/opt/$_pkgname/"

	install -dm755 "$pkgdir/usr/bin/"
	ln -sf "/opt/$_pkgname/MongoDB Compass$_edition" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 "usr/share/applications/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "usr/share/pixmaps/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	for _license in 'LICENSE' 'LICENSES.chromium.html'; do
		ln -sf "/opt/$_pkgname/$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
