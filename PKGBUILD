# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='mongodb-compass-isolated'
pkgname="$_pkgname-bin"
_pkgver='1.20.4'
pkgver="$(printf '%s' "$_pkgver" | tr '-' '.')"
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Isolated Edition - binary version'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom:SSPL')
depends=('electron3-bin' 'krb5' 'libsecret')
source=(
	"$pkgname-$pkgver-$pkgrel.rpm::https://github.com/mongodb-js/compass/releases/download/v$_pkgver/$_pkgname-$_pkgver.x86_64.rpm"
	'launch.sh'
)
sha256sums=('8afd91fa38ef759cc8287aa3e06c8c47c8a633aa43bc9e838c588fd520a9ec01'
            '1bf3dd5e9363e750f4099acab9c8e22af7dc8645215d3fc4ed13abb0d38c5137')

package() {
	cd "$srcdir/"
	install -Dm644 "usr/share/$_pkgname/resources/app.asar" "$pkgdir/usr/lib/$_pkgname/app.asar"
	install -dm755 "$pkgdir/usr/lib/$_pkgname/app.asar.unpacked/"
	cp -r --no-preserve=ownership --preserve=mode "usr/share/$_pkgname/resources/app.asar.unpacked/"* "$pkgdir/usr/lib/$_pkgname/app.asar.unpacked/"
	install -Dm755 "launch.sh" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "usr/share/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "usr/share/$_pkgname/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
	install -Dm644 "usr/share/applications/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "usr/share/pixmaps/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
