# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=('lua-psl' 'lua51-psl' 'lua52-psl')
pkgver=0.3
pkgrel=1
arch=('x86_64')
url='https://github.com/daurnimator/lua-psl'
license=('MIT')
makedepends=('lua' 'lua51' 'lua52')
depends=('libpsl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/daurnimator/lua-psl/archive/v$pkgver.tar.gz")
md5sums=('9171823dbd4d347a5aa1150710cc991d')

build() {
	cd "lua-psl-$pkgver"

	gcc -fPIC $CPPFLAGS $CFLAGS -o psl/psl.o -c psl/psl.c
	gcc -shared $LDFLAGS -o psl.so psl/psl.o -lpsl

	gcc -fPIC $CPPFLAGS $CFLAGS -I/usr/include/lua5.1 -o psl/psl.o -c psl/psl.c
	gcc -shared $LDFLAGS -o psl-5.1.so psl/psl.o -lpsl

	gcc -fPIC $CPPFLAGS $CFLAGS -I/usr/include/lua5.2 -o psl/psl.o -c psl/psl.c
	gcc -shared $LDFLAGS -o psl-5.2.so psl/psl.o -lpsl
}

package_lua-psl() {
	pkgdesc='libpsl bindings for Lua 5.3'

	cd "lua-psl-$pkgver"
	install -D psl.so "$pkgdir/usr/lib/lua/5.3/psl.so"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua51-psl() {
	pkgdesc='libpsl bindings for Lua 5.1'

	cd "lua-psl-$pkgver"
	install -D psl-5.1.so "$pkgdir/usr/lib/lua/5.1/psl.so"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-psl() {
	pkgdesc='libpsl bindings for Lua 5.2'

	cd "lua-psl-$pkgver"
	install -D psl-5.2.so "$pkgdir/usr/lib/lua/5.2/psl.so"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
