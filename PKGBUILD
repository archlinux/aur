# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=lua52-compat53
pkgver=0.3
pkgrel=0
arch=('i686' 'x86_64')
url='https://github.com/keplerproject/lua-compat-5.3'
license=('MIT')
makedepends=('lua52')
source=("https://github.com/keplerproject/lua-compat-5.3/archive/v$pkgver.tar.gz")
md5sums=('98f93f9de24b26ee5f6f7053979599f8')

build() {
	cd lua-compat-5.3-"$pkgver"

	gcc $CFLAGS -fPIC -I/usr/include/lua5.2 -c lutf8lib.c -o lutf8lib.o
	gcc $CFLAGS -fPIC -I/usr/include/lua5.2 -c lstrlib.c -o lstrlib.o
	gcc $CFLAGS -fPIC -I/usr/include/lua5.2 -c ltablib.c -o ltablib.o
	gcc -shared -o utf8.so lutf8lib.o
	gcc -shared -o string.so lstrlib.o
	gcc -shared -o table.so ltablib.o
}

package() {
	pkgdesc='Compatibility module providing Lua-5.3-style APIs for Lua 5.2'

	cd lua-compat-5.3-"$pkgver"
	install -Dm644 compat53/{init,module}.lua -t "$pkgdir"/usr/share/lua/5.2/compat53
	install -Dm644 {utf8,string,table}.so -t "$pkgdir"/usr/lib/lua/5.2/compat53/
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
