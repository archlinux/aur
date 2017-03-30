# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=(lua-psl lua51-psl lua52-psl)
pkgver=0.2
pkgrel=0
arch=('i686' 'x86_64')
url='https://github.com/daurnimator/lua-psl'
license=('MIT')
makedepends=('lua' 'lua51' 'lua52')
depends=('libpsl')
source=('https://github.com/daurnimator/lua-psl/archive/v0.2.tar.gz')
md5sums=('f99781d19e18902d97fb4892150552bd')

build() {
	cd lua-psl-"$pkgver"
	gcc -O2 -fPIC -c psl/psl.c -o psl/psl.o
	gcc -shared -o psl.so psl/psl.o -lpsl

	gcc -O2 -fPIC -I/usr/include/lua5.1 -c psl/psl.c -o psl/psl.o
	gcc -shared -o psl-5.1.so psl/psl.o -lpsl

	gcc -O2 -fPIC -I/usr/include/lua5.2 -c psl/psl.c -o psl/psl.o
	gcc -shared -o psl-5.2.so psl/psl.o -lpsl
}

package_lua-psl() {
	pkgdesc='libpsl bindings for Lua 5.3'

	cd lua-psl-"$pkgver"
	install -D psl.so "$pkgdir"/usr/lib/lua/5.3/psl.so
	install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_lua51-psl() {
	pkgdesc='libpsl bindings for Lua 5.1'

	cd lua-psl-"$pkgver"
	install -D psl-5.1.so "$pkgdir"/usr/lib/lua/5.1/psl.so
	install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_lua52-psl() {
	pkgdesc='libpsl bindings for Lua 5.2'

	cd lua-psl-"$pkgver"
	install -D psl-5.2.so "$pkgdir"/usr/lib/lua/5.2/psl.so
	install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
