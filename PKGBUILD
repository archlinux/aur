# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=(lua51-compat53 lua52-compat53)
pkgver=0.4
pkgrel=0
arch=('i686' 'x86_64')
url='https://github.com/keplerproject/lua-compat-5.3'
license=('MIT')
makedepends=('lua51' 'lua52')
source=("https://github.com/keplerproject/lua-compat-5.3/archive/v$pkgver.tar.gz")
md5sums=('21d27a6edcb677e78cea365ac275bcc9')

build() {
	cd lua-compat-5.3-"$pkgver"
	mkdir 5.1 5.2

	gcc $CFLAGS -fPIC -I/usr/include/lua5.1 -c lutf8lib.c -o 5.1/lutf8lib.o
	gcc $CFLAGS -fPIC -I/usr/include/lua5.1 -c lstrlib.c -o 5.1/lstrlib.o
	gcc $CFLAGS -fPIC -I/usr/include/lua5.1 -c ltablib.c -o 5.1/ltablib.o
	gcc -shared -o 5.1/utf8.so 5.1/lutf8lib.o
	gcc -shared -o 5.1/string.so 5.1/lstrlib.o
	gcc -shared -o 5.1/table.so 5.1/ltablib.o

	gcc $CFLAGS -fPIC -I/usr/include/lua5.2 -c lutf8lib.c -o 5.2/lutf8lib.o
	gcc $CFLAGS -fPIC -I/usr/include/lua5.2 -c lstrlib.c -o 5.2/lstrlib.o
	gcc $CFLAGS -fPIC -I/usr/include/lua5.2 -c ltablib.c -o 5.2/ltablib.o
	gcc -shared -o 5.2/utf8.so 5.2/lutf8lib.o
	gcc -shared -o 5.2/string.so 5.2/lstrlib.o
	gcc -shared -o 5.2/table.so 5.2/ltablib.o
}

package_lua51-compat53() {
	pkgdesc='Compatibility module providing Lua-5.3-style APIs for Lua 5.1'

	cd lua-compat-5.3-"$pkgver"
	install -Dm644 compat53/{init,module}.lua -t "$pkgdir"/usr/share/lua/5.1/compat53
	install -Dm644 5.1/{utf8,string,table}.so -t "$pkgdir"/usr/lib/lua/5.1/compat53/
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_lua52-compat53() {
	pkgdesc='Compatibility module providing Lua-5.3-style APIs for Lua 5.2'

	cd lua-compat-5.3-"$pkgver"
	install -Dm644 compat53/{init,module}.lua -t "$pkgdir"/usr/share/lua/5.2/compat53
	install -Dm644 5.2/{utf8,string,table}.so -t "$pkgdir"/usr/lib/lua/5.2/compat53/
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
