# Contributor: jll <paci79@free.fr>
# Contributor: Giancarlo Bianchi <giancarlobianchi76 -at- gmail -dot- com>
# Contributor: optiseth (AUR)
# Contributor: SanskritFritz (gmail)
# Maintainer: pfm <vorticity at mail dot ru>
 
pkgname=rarcrack
pkgver=0.2
pkgrel=6
pkgdesc="Use brute force algorithm to find the correct password for rar, 7z, zip archives."
arch=('i686' 'x86_64')
license=('GPL')
url="http://rarcrack.sourceforge.net/"
depends=('libxml2')
optdepends=('unrar: to crack rar archives'
            'unrar-free: to crack rar archives'
            'p7zip: to crack 7z archives'
            'unzip: to crack zip archives')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ziman/$pkgname/archive/$pkgver.tar.gz"
        "file-type-detection.patch")
sha256sums=('662d14f080431424c816eca11cea00fe8eeb5bf0d2da36e18f5d07140c0a78af'
            '8d39315ead8f6058bc8f37b6724e7d266eed2b7ee79910de6a5a4bc2ee80bbe4')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	# https://github.com/optiseth/rarcrack-fix Thank you optiseth:
	patch -p0 -i "$srcdir/file-type-detection.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}
 
package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m0755 rarcrack "$pkgdir/usr/bin/rarcrack"
	install -d -m0755 "$pkgdir/usr/share/doc/$pkgname"
	install -m0644 -t "$pkgdir/usr/share/doc/$pkgname" CHANGELOG LICENSE README README.html RELEASE_NOTES
}
