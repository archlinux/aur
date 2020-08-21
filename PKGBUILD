# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=scratch3
pkgver=3.14.0
pkgrel=2
pkgdesc="Create stories, games, and animations, share with others around the world"
arch=('any')
url="https://scratch.mit.edu/"
license=('BSD')
depends=(electron)
makedepends=(p7zip)
conflicts=(scratch3-bin)
source=("https://downloads.scratch.mit.edu/desktop/Scratch%20Desktop%20Setup%20$pkgver.exe"
	"https://scratch.mit.edu/images/download/icon.png"
	"$pkgname"
	"$pkgname.desktop"
	"$pkgname.xml")
noextract=("Scratch%20Desktop%20Setup%20$pkgver.exe")
sha512sums=('41f340f5a312c3a8be7148d332a3a7e376a4dc1d85f86b07d2aa3d1ea3de352a87404ea702c02550e7089c446a35be92c69ab90baa8800261e3730b30fae8fe6'
            '66ec37746fa3fdc21c30a53050f73cd989b0da01edecb4dc75aadae8cb616a8913ff3ec0e4145d214b06548cf1a767eea1c1890a617e484db4da009867304a43'
            'd9dd01d52f91ded4ef033dcd22ed97e7bf3a2afc64b28b5c2d36efd095897953f0d93b7e5ec98905b970f99da2fa57b88e56e01cad54eec13af98e4786cb5bc7'
            '429dd0954dbd32d38ca38e77940bd63dac975c7da0f91ba2b6bbe1b70ba146d751cea48ff9c667594bf49ff6b3d8949410fc76dc67106bc25387b60fe78a7d01'
            '1931b9075f22bb81f88fc8a2813c4ac4e902bd657257e835adcf2c64b686a5024b367cb8a721f453ccf968d64def59ee79aecb10a28230980cfee8a351ebf69b')

prepare() {
	7za x -bd -y "$srcdir/Scratch%20Desktop%20Setup%20$pkgver.exe" resources

	# Fix permissions
	chmod 755 "$srcdir/resources"
	chmod 755 "$srcdir/resources/static"
	chmod 755 "$srcdir/resources/static/assets"
}

package() {
	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/applications/" "$srcdir/$pkgname.desktop"
	install -Dm644 -t "$pkgdir/usr/share/mime/packages/" "$srcdir/$pkgname.xml"

	install -Dm644 -t "$pkgdir/usr/share/$pkgname/" "$srcdir/resources/app.asar"
	cp -r "$srcdir/resources/static/" "$pkgdir/usr/share/$pkgname/"

	install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/72x72/apps/$pkgname.png"
	install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/72x72/mimetypes/x-$pkgname-project.png"
}
