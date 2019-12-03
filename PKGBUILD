# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=generate-ipv6-address
pkgver=0.1
pkgrel=1
pkgdesc="Perform IPv6 address generation"
arch=('x86_64')
url="https://www.irif.fr/~jch/software/ahcp/ahcp-generate-address.html"
license=('MIT')
# Could not use the signature .asc file for some reason
source=("https://www.irif.fr/~jch/software/files/$pkgname-$pkgver.tar.gz")
sha256sums=('e1356d245d5f891fa39b796a8a2deefdaa89f08130dc97a378738ca5ed9a20fa')

build() {
	cd "$pkgname-$pkgver"
	sed -n '/Copyright/,/ SOFTWARE\./p' generate-ipv6-address.c > LICENSE
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin" \
	         "$pkgdir/usr/share/man/man8" \
	         "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm755 generate-ipv6-address "$pkgdir/usr/bin/"
	install -Dm644 generate-ipv6-address.man "$pkgdir/usr/share/man/man8/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
