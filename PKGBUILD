# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=lua51-compat53
pkgver=0.4
pkgrel=0
arch=('i686' 'x86_64')
url='https://github.com/keplerproject/lua-compat-5.3'
license=('MIT')
makedepends=('lua51')
source=("https://github.com/keplerproject/lua-compat-5.3/archive/v$pkgver.tar.gz")
md5sums=('21d27a6edcb677e78cea365ac275bcc9')

build() {
	cd lua-compat-5.3-"$pkgver"

	gcc $CFLAGS -fPIC -I/usr/include/lua5.1 -c lutf8lib.c -o lutf8lib.o
	gcc $CFLAGS -fPIC -I/usr/include/lua5.1 -c lstrlib.c -o lstrlib.o
	gcc $CFLAGS -fPIC -I/usr/include/lua5.1 -c ltablib.c -o ltablib.o
	gcc -shared -o utf8.so lutf8lib.o
	gcc -shared -o string.so lstrlib.o
	gcc -shared -o table.so ltablib.o
}

package() {
	pkgdesc='Compatibility module providing Lua-5.3-style APIs for Lua 5.1'

	cd lua-compat-5.3-"$pkgver"
	install -Dm644 compat53/{init,module}.lua -t "$pkgdir"/usr/share/lua/5.1/compat53
	install -Dm644 {utf8,string,table}.so -t "$pkgdir"/usr/lib/lua/5.1/compat53/
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
