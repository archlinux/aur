# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>

pkgname=('lua-md5' 'lua51-md5' 'lua52-md5' 'lua53-md5')
pkgver=1.3
pkgrel=2
pkgdesc="Basic cryptographic facilities for Lua"
arch=('x86_64')
url="https://github.com/keplerproject/md5"
license=('MIT')
makedepends=('lua' 'lua51' 'lua52' 'lua53')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        install.patch
        LICENSE)
sha256sums=('0747a88d89c5d9b71e15fd614ac77a027627ce9ed222d3eb9ddee66f9fd46da4'
            'ef2bb7d67992f5ebcce908d0664cf96015b779d873aec2d29aeb6610bdd525ae'
            '6b33a65cf51a300efeb5d76afa0d02c25b0c0080afd68a88680cb9ce685fef8d')

prepare() {
	patch -p1 -d "md5-$pkgver" < install.patch
	mv "md5-$pkgver" "$pkgname-$pkgver"
	for i in 51 52 53; do
		cp -a "$pkgname-$pkgver" "${pkgname/lua/lua$i}-$pkgver"
	done
}

package_lua-md5() {
	pkgdesc="$pkgdesc 5.4"
	depends=('lua')

	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	cd "$pkgname-$pkgver"
	make install PREFIX=/usr DESTDIR="$pkgdir/" LUA_SYS_VER=5.4
}

package_lua51-md5() {
	pkgdesc="$pkgdesc 5.1"
	depends=('lua51')

	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	cd "$pkgname-$pkgver"
	make install PREFIX=/usr DESTDIR="$pkgdir/" LUA_SYS_VER=5.1
}

package_lua52-md5() {
	pkgdesc="$pkgdesc 5.2"
	depends=('lua52')

	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	cd "$pkgname-$pkgver"
	make install PREFIX=/usr DESTDIR="$pkgdir/" LUA_SYS_VER=5.2
}

package_lua53-md5() {
	pkgdesc="$pkgdesc 5.3"
	depends=('lua53')

	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	cd "$pkgname-$pkgver"
	make install PREFIX=/usr DESTDIR="$pkgdir/" LUA_SYS_VER=5.3
}
