# Maintainer: Ignacio Losiggio <iglosiggio@dc.uba.ar>
pkgname=gild
pkgver=0.4.0
pkgrel=1
pkgdesc="Terminal Gopher Client, in LDPL"
arch=('x86_64')
url="https://github.com/dvkt/gild"
license=('custom: MIT')
depends=('glibc')
makedepends=('ldpl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dvkt/$pkgname/archive/v$pkgver.tar.gz"
        "ldpl-socket-0.1.0.tar.gz::https://github.com/dvkt/ldpl-socket/archive/v0.1.0.tar.gz"
	"use-compilation-flags.patch")
md5sums=('ce6cda1dd77549f368b51b69cac76d9d'
         'c184c705d73aab06d046eb66675b6d63'
         '2ff698279324e30c59a7e82b66a48055')

prepare() {
	if [ ! -d "$pkgname-$pkgver/ldpl_socket" ]; then
		mv ldpl-socket-0.1.0/ldpl_socket \
		   "$pkgname-$pkgver"
	fi
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/use-compilation-flags.patch"
}

build() {
	cd "$pkgname-$pkgver/"
	make LDFLAGS="$LDFLAGS" build
}

package() {
	cd "$pkgname-$pkgver/"
	install -D gild "$pkgdir/usr/bin/gild"
	install -D LICENSE "$pkgdir/usr/share/licenses/gild/LICENSE"
}
