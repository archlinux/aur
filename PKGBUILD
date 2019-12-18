# Maintainer: Ignacio Losiggio <iglosiggio@dc.uba.ar>
pkgname=gild
pkgver=0.3.0
pkgrel=1
pkgdesc="Terminal Gopher Client, in LDPL"
arch=('x86_64')
url="https://github.com/dvkt/gild"
license=('custom: MIT')
depends=('glibc')
makedepends=('ldpl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dvkt/$pkgname/archive/v$pkgver.tar.gz"
        "ldpl-socket-99a9f27.tar.gz::https://github.com/dvkt/ldpl-socket/archive/99a9f27.tar.gz"
	"use-compilation-flags.patch")
md5sums=('1d3d870d8cc448332dea0c2ffa805c8f'
         '99f7e1bce036bb6efd7730fed60e04e5'
         '285b29f8e2da2efad90a2f3ff1512db5')

prepare() {
	if [ ! -d "$pkgname-$pkgver/ldpl_socket" ]; then
		mv ldpl-socket-99a9f27b7363392bd70d0a22208cd3e2bf74905b/ldpl_socket \
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
