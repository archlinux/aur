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
	"use-compilation-flags.patch")
md5sums=('1d3d870d8cc448332dea0c2ffa805c8f'
         '285b29f8e2da2efad90a2f3ff1512db5')

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
