# Maintainer: Daniel Melani <daniel.melani@gmail.com>

pkgname=sanctum
pkgver=1.0.4
pkgrel=1
pkgdesc="A small, reviewable, capable, pq-secure and fully privilege separated VPN daemon"
arch=('x86_64')
url="https://sanctorum.se"
license=('ISC')
depends=('libsodium')
source=("${url}/releases/${pkgname}-${pkgver}.tgz")
sha256sums=('9f50635865e9bf1ec456d5b64c16bf85a133a592f44b8f8c3e4f3ebc1e53dd84')

conflicts=('sanctum-git')

build() {
	unset CFLAGS
	cd "$srcdir/$pkgname-$pkgver"
	CFLAGS="-ffile-prefix-map=${srcdir}=/usr/src/debug/sanctum" make  PREFIX=/usr
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
