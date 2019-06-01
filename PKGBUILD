# Maintainer: Ignacio Losiggio <iglosiggio@dc.uba.ar>
pkgname=gild
pkgver=0.2.0
pkgrel=1
pkgdesc="Terminal Gopher Client, in LDPL"
arch=('x86_64')
url="https://github.com/dvkt/gild"
license=('custom: MIT')
depends=('glibc')
makedepends=('ldpl')
source=("https://github.com/dvkt/$pkgname/archive/v$pkgver.tar.gz"
	"use-compilation-flags.patch")
md5sums=('ac3b16ca677d95f602bf26ed50ee0679' '6d85d23f24e565abac42abe5ce873e2d') 

prepare() {
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
