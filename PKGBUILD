# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=scratch3
pkgver=3.12.0
pkgrel=1
pkgdesc="Create stories, games, and animations, share with others around the world."
arch=('any')
url="https://scratch.mit.edu/"
license=('BSD')
depends=(electron)
makedepends=(p7zip)
conflicts=(scratch3-bin)
source=("https://downloads.scratch.mit.edu/desktop/Scratch%20Desktop%20Setup%20$pkgver.exe"
	"https://scratch.mit.edu/images/download/icon.png"
	$pkgname
	$pkgname.desktop)
noextract=("Scratch%20Desktop%20Setup%20$pkgver.exe")
sha512sums=('567c8e947dfd58d19ca3134864fe5dfa2d75b05cbcd49d85bac38ab8be9eedfd4431c989643471229f69eef990991e4c2382bede036e31e89aa61366cfc2d45e'
            '66ec37746fa3fdc21c30a53050f73cd989b0da01edecb4dc75aadae8cb616a8913ff3ec0e4145d214b06548cf1a767eea1c1890a617e484db4da009867304a43'
            'd9dd01d52f91ded4ef033dcd22ed97e7bf3a2afc64b28b5c2d36efd095897953f0d93b7e5ec98905b970f99da2fa57b88e56e01cad54eec13af98e4786cb5bc7'
            '98d9e8045db7e2c9394c6efe50088c7151b8a3be29bd3009f8d28bb1a46a0e65d0ed14e406b998ced346183deebd29415ecee4a25d231ab4f2abe8c7bd0b3fc5')

prepare() {
	7za x -bd -y "$srcdir/Scratch%20Desktop%20Setup%20$pkgver.exe" resources

	# Fix permissions
	chmod 755 "$srcdir/resources"
	chmod 755 "$srcdir/resources/static"
	chmod 755 "$srcdir/resources/static/assets"
}

package() {
	install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/$pkgname.desktop"
	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname"

	install -Dm644 -t "$pkgdir/usr/share/$pkgname/" "$srcdir/resources/app.asar"
	cp -r "$srcdir/resources/static" "$pkgdir/usr/share/$pkgname/"

	install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/72x72/apps/$pkgname.png"
}
