# Maintainer: Daniel Melani <daniel.melani@gmail.com>

pkgname=sanctum
pkgver=1.3.0
pkgrel=1
pkgdesc="A small, reviewable, capable, pq-secure and fully privilege separated VPN daemon"
arch=('x86_64')
url="https://sanctorum.se"
license=('ISC')
depends=('libsodium')
source=("${url}/releases/${pkgname}-${pkgver}.tgz")
sha256sums=('2eb8b05485b98363e4cec108b7b0a6074f4b6ebd19ea42ebad1e39e41ae0082c')

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
