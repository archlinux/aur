# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Laszlo Papp <djszapi at archlinux us>
# Contributor: Donald Ephraim Curtis <dcurtis@gmail.com>

pkgname=('lua51-luapenlight')
_pkgname=('lua-penlight')
pkgver=1.3.2
pkgrel=1
pkgdesc='Lua libraries focusing on input data handling'
arch=('any')
url='https://github.com/stevedonovan/penlight'
license=('custom')
depends=('lua51' 'lua51-filesystem')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/stevedonovan/penlight/archive/$pkgver.tar.gz")
md5sums=('0315a39834bb6fab07741ec04ede1bf4')

check() {
	cd Penlight-$pkgver
	export LUA_PATH="$PWD/lua/?/init.lua;$PWD/lua/?.lua;$(lua5.1 -e 'print(package.path)')"
	lua5.1 run.lua
}

package() {
	cd Penlight-$pkgver
	install -dm755 "$pkgdir/usr/share/lua/5.1/pl"
	install -m644 lua/pl/* "$pkgdir/usr/share/lua/5.1/pl"

	# copy docs
	install -dm755 "$pkgdir/usr/share/doc/$_pkgname/"{,manual,examples}
	install -m644 CONTRIBUTING.md CHANGES.md README.md "$pkgdir/usr/share/doc/$_pkgname"
	install -m644 doc/manual/* "$pkgdir/usr/share/doc/$_pkgname/manual"
	install -m644 examples/* "$pkgdir/usr/share/doc/$_pkgname/examples"

	# copy license
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
