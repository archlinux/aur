# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=scratch3
pkgver=3.16.1
pkgrel=1
pkgdesc="Create stories, games, and animations, share with others around the world"
arch=('any')
url="https://scratch.mit.edu/"
license=('BSD')
depends=(electron)
makedepends=(p7zip)
source=("https://downloads.scratch.mit.edu/desktop/Scratch%20$pkgver%20Setup.exe"
        "https://scratch.mit.edu/images/download/icon.png"
        "$pkgname"
        "$pkgname.desktop"
        "$pkgname.xml")
noextract=("Scratch%20$pkgver%20Setup.exe")
sha512sums=('d20d543d3257da6a744884945071955e9d332b461e18e8b544f872738a86cae99031a1e0f45032651851ebe7ff01bc618d94b68911cbae2f6c640ec830f6e914'
            '66ec37746fa3fdc21c30a53050f73cd989b0da01edecb4dc75aadae8cb616a8913ff3ec0e4145d214b06548cf1a767eea1c1890a617e484db4da009867304a43'
            'd9dd01d52f91ded4ef033dcd22ed97e7bf3a2afc64b28b5c2d36efd095897953f0d93b7e5ec98905b970f99da2fa57b88e56e01cad54eec13af98e4786cb5bc7'
            '429dd0954dbd32d38ca38e77940bd63dac975c7da0f91ba2b6bbe1b70ba146d751cea48ff9c667594bf49ff6b3d8949410fc76dc67106bc25387b60fe78a7d01'
            '9d64101c6dc8eb961c130ed7b7bb3a49f482b02674d4fa28b45e836634bda8e02de3fdf84aab6291c2781597e494737a5ba29cbf7a9c7e1e110a3fcba87f6eb8')

prepare() {
	7za x -bd -y "$srcdir/Scratch%20$pkgver%20Setup.exe" resources/

	# Fix permissions
	chmod 755 "$srcdir/"resources/{,static/{,assets/}}
}

package() {
	install -Dm644 -t "$pkgdir/usr/share/$pkgname/" "$srcdir/resources/app.asar"
	cp -r "$srcdir/resources/static/" "$pkgdir/usr/share/$pkgname/"

	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/applications/" "$srcdir/$pkgname.desktop"
	install -Dm644 -t "$pkgdir/usr/share/mime/packages/" "$srcdir/$pkgname.xml"

	install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/72x72/apps/$pkgname.png"
	install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/72x72/mimetypes/x-$pkgname-project.png"
}
