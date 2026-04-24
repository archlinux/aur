# Maintainer: Daniel Melani <daniel.melani@gmail.com>

pkgname=sanctum
pkgver=1.1.0
pkgrel=1
pkgdesc="A small, reviewable, capable, pq-secure and fully privilege separated VPN daemon"
arch=('x86_64')
url="https://sanctorum.se"
license=('ISC')
depends=('libsodium')
source=("${url}/releases/${pkgname}-${pkgver}.tgz")
sha256sums=('17ccba4f8d495f65beff5bfdfd8ebaaaba75ec0283874d8b17fc3ada9fd8b3e6')

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
