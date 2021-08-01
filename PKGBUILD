# Maintainer: osch <oliver@luced.de>

_pkgluaname=lpugl
pkgname=lua-$_pkgluaname
pkgver=0.0.1
_luacmd="lua"
pkgrel=1
_rockrel=1
pkgdesc="Minimal Lua-API for building cross platform GUIs"
arch=("i686" "x86_64")
url="https://github.com/osch/lua-lpugl#lpugl"
license=("MIT")
depends=("lua" "lua-oocairo" "libgl")
makedepends=("luarocks")
source=("https://github.com/osch/lua-$_pkgluaname/archive/v$pkgver.tar.gz")
package() {
	_luaver=$($_luacmd -e 'io.write(_VERSION:gsub("^.* (.*)$","%1"),"")')
	cd "$srcdir/$pkgname-$pkgver"
	sed -i -e 's/, "oocairo"//' "rockspecs/"$_pkgluaname"_cairo-$pkgver-$_rockrel.rockspec"
	luarocks --lua-version $_luaver --tree="$pkgdir/usr" make "rockspecs/"$_pkgluaname"-$pkgver-$_rockrel.rockspec"
	luarocks --lua-version $_luaver --tree="$pkgdir/usr" make "rockspecs/"$_pkgluaname"_cairo-$pkgver-$_rockrel.rockspec"
	luarocks --lua-version $_luaver --tree="$pkgdir/usr" make "rockspecs/"$_pkgluaname"_opengl-$pkgver-$_rockrel.rockspec"
	mkdir -p "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mv "$pkgdir/usr/lib/luarocks/rocks-"*"/$_pkgluaname/$pkgver-$_rockrel/doc" "$pkgdir/usr/share/doc/$pkgname"
	rm -rf "$pkgdir/usr/share/lua"
	chmod -R 0644 "$pkgdir/usr/share/doc/$pkgname"/*
	ln -s "../../doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm -rf "$pkgdir/usr/lib/luarocks"
}

md5sums=('7d9408f67a69790262b22e5618f45448')
