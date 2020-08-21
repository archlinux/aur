# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=scratch3
pkgver=3.14.0
pkgrel=1
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
	"$pkgname.desktop")
noextract=("Scratch%20Desktop%20Setup%20$pkgver.exe")
sha512sums=('41f340f5a312c3a8be7148d332a3a7e376a4dc1d85f86b07d2aa3d1ea3de352a87404ea702c02550e7089c446a35be92c69ab90baa8800261e3730b30fae8fe6'
            '66ec37746fa3fdc21c30a53050f73cd989b0da01edecb4dc75aadae8cb616a8913ff3ec0e4145d214b06548cf1a767eea1c1890a617e484db4da009867304a43'
            'd9dd01d52f91ded4ef033dcd22ed97e7bf3a2afc64b28b5c2d36efd095897953f0d93b7e5ec98905b970f99da2fa57b88e56e01cad54eec13af98e4786cb5bc7'
            '22b5e0cabd21b2c0868f79454a0d751fa1319b5039c50cebe7ec9ab2c957a6ee3735af1ba60333601bdfd89fffcedb4c2b5e6da1e6d2c2ef56bc64fcd30e4f39')

prepare() {
	7za x -bd -y "$srcdir/Scratch%20Desktop%20Setup%20$pkgver.exe" resources

	# Fix permissions
	chmod 755 "$srcdir/resources"
	chmod 755 "$srcdir/resources/static"
	chmod 755 "$srcdir/resources/static/assets"
}

package() {
	install -Dm644 -t "$pkgdir/usr/share/applications/" "$srcdir/$pkgname.desktop"
	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname"

	install -Dm644 -t "$pkgdir/usr/share/$pkgname/" "$srcdir/resources/app.asar"
	cp -r "$srcdir/resources/static/" "$pkgdir/usr/share/$pkgname/"

	install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/72x72/apps/$pkgname.png"
}
