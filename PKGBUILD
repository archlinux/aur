# Maintainer: Daniel Melani <daniel.melani@gmail.com>

pkgname=sanctum
pkgver=1.4.0
pkgrel=1
pkgdesc="A small, reviewable, capable, pq-secure and fully privilege separated VPN daemon"
arch=('x86_64')
url="https://sanctorum.se"
license=('ISC')
depends=('libsodium')
source=("${url}/releases/${pkgname}-${pkgver}.tgz")
sha256sums=('f38874300689e72eecc0857f4063b5255bd4348acd6534aef42999f1b1a70e3d')

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
