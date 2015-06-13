# Contributor: jll <paci79@free.fr>
# Contributor: Giancarlo Bianchi <giancarlobianchi76 -at- gmail -dot- com>
# Contributor: optiseth (AUR)
# Maintainer: SanskritFritz (gmail)
 
pkgname=rarcrack
pkgver=0.2
pkgrel=4
pkgdesc="Use brute force algorithm to find the correct password for rar, 7z, zip archives."
arch=('i686' 'x86_64')
license=('GPL')
url="http://rarcrack.sourceforge.net/"
depends=('libxml2')
optdepends=('unrar: to crack rar archives'
            'unrar-free: to crack rar archives'
            'p7zip: to crack 7z archives'
            'unzip: to crack zip archives')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver/%5BUnnamed%20release%5D/$pkgname-$pkgver.tar.bz2"
        "file-type-detection.patch")
 
build() {
	cd "$srcdir/$pkgname-$pkgver"
	# https://github.com/optiseth/rarcrack-fix Thank you optiseth:
	patch < "$srcdir/file-type-detection.patch"
	make
}
 
package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m0755 rarcrack "$pkgdir/usr/bin/rarcrack"
	install -d -m0755 "$pkgdir/usr/share/doc/$pkgname"
	install -m0644 -t "$pkgdir/usr/share/doc/$pkgname" CHANGELOG LICENSE README README.html RELEASE_NOTES
}

md5sums=('62d0cf77c6c4edc7204305649f8b7362'
         '5866a692fe1ea4bcd8df85fd914c51aa')

