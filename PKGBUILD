# Maintainer: Daniel Melani <daniel.melani@gmail.com>

pkgname=sanctum
pkgver=1.4.2
pkgrel=1
pkgdesc="A small, reviewable, capable, pq-secure and fully privilege separated VPN daemon"
arch=('x86_64')
url="https://sanctorum.se"
license=('ISC')
depends=('libsodium')
source=("${url}/releases/${pkgname}-${pkgver}.tgz")
sha256sums=('886cb491742e0ed788744126b01653dcaa81ea35d502dd8886794fcc5d63c1d5')

conflicts=('sanctum-git')

build() {
	unset CFLAGS
	cd "$srcdir/$pkgname-$pkgver"
	CFLAGS="-ffile-prefix-map=${srcdir}=/usr/src/debug/sanctum" make  PREFIX=/usr
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir $pkgdir/etc
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
