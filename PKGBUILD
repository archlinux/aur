# Maintainer: Daurnimator <quae@daurnimator.com>

pkgbase='lua-compat53'
pkgname=('lua51-compat53' 'lua52-compat53')
pkgver=0.7
pkgrel=1
arch=('x86_64')
url='https://github.com/keplerproject/lua-compat-5.3'
license=('MIT')
makedepends=('lua51' 'lua52')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keplerproject/lua-compat-5.3/archive/v$pkgver.tar.gz")
md5sums=('61c3f1af0d7d587f602ac4a13d77a823')

build() {
	cd "lua-compat-5.3-$pkgver"
	mkdir 5.1 5.2

	gcc $CPPFLAGS $CFLAGS -fPIC -I/usr/include/lua5.1 -c lutf8lib.c -o 5.1/lutf8lib.o
	gcc $CPPFLAGS $CFLAGS -fPIC -I/usr/include/lua5.1 -c lstrlib.c -o 5.1/lstrlib.o
	gcc $CPPFLAGS $CFLAGS -fPIC -I/usr/include/lua5.1 -c ltablib.c -o 5.1/ltablib.o
	gcc -shared $LDFLAGS -o 5.1/utf8.so 5.1/lutf8lib.o
	gcc -shared $LDFLAGS -o 5.1/string.so 5.1/lstrlib.o
	gcc -shared $LDFLAGS -o 5.1/table.so 5.1/ltablib.o

	gcc $CPPFLAGS $CFLAGS -fPIC -I/usr/include/lua5.2 -c lutf8lib.c -o 5.2/lutf8lib.o
	gcc $CPPFLAGS $CFLAGS -fPIC -I/usr/include/lua5.2 -c lstrlib.c -o 5.2/lstrlib.o
	gcc $CPPFLAGS $CFLAGS -fPIC -I/usr/include/lua5.2 -c ltablib.c -o 5.2/ltablib.o
	gcc -shared $LDFLAGS -o 5.2/utf8.so 5.2/lutf8lib.o
	gcc -shared $LDFLAGS -o 5.2/string.so 5.2/lstrlib.o
	gcc -shared $LDFLAGS -o 5.2/table.so 5.2/ltablib.o
}

package_lua51-compat53() {
	pkgdesc='Compatibility module providing Lua-5.3-style APIs for Lua 5.1'

	cd "lua-compat-5.3-$pkgver"
	install -Dm644 compat53/{init,module}.lua -t "$pkgdir/usr/share/lua/5.1/compat53"
	install -D 5.1/{utf8,string,table}.so -t "$pkgdir/usr/lib/lua/5.1/compat53/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-compat53() {
	pkgdesc='Compatibility module providing Lua-5.3-style APIs for Lua 5.2'

	cd "lua-compat-5.3-$pkgver"
	install -Dm644 compat53/{init,module}.lua -t "$pkgdir/usr/share/lua/5.2/compat53"
	install -D 5.2/{utf8,string,table}.so -t "$pkgdir/usr/lib/lua/5.2/compat53/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
