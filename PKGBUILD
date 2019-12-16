# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-isolated'
pkgver='1.20.3'
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Isolated Edition'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('electron3-bin' 'krb5' 'libsecret')
source=("$pkgname-$pkgver-$pkgrel::https://downloads.mongodb.com/compass/mongodb-compass-isolated-1.20.3.x86_64.rpm"
		'launch.sh')
sha256sums=('d74fa71d99eba9c597daf4ffadb1cb733bc1e47a273a33bd916524b63e65b1ba'
            '1bf3dd5e9363e750f4099acab9c8e22af7dc8645215d3fc4ed13abb0d38c5137')

package() {
	cd "$srcdir/"
	install -Dm644 "usr/share/$pkgname/resources/app.asar" "$pkgdir/usr/lib/$pkgname/app.asar"
	install -dm755 "$pkgdir/usr/lib/$pkgname/app.asar.unpacked/"
	cp -r --no-preserve=ownership --preserve=mode "usr/share/$pkgname/resources/app.asar.unpacked/"* "$pkgdir/usr/lib/$pkgname/app.asar.unpacked/"
	install -Dm755 "launch.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "usr/share/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "usr/share/$pkgname/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
	install -Dm644 "usr/share/applications/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "usr/share/pixmaps/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
