# Maintainer: osch <oliver@luced.de>

_pkgluaname=mtstates
_luacmd="lua"
_rockrel=1
pkgname=lua-$_pkgluaname
pkgver=0.4.2
pkgrel=1
pkgdesc="This package provides a way to create new Lua states from within Lua for using them in arbitrary threads"
arch=("i686" "x86_64")
url="https://github.com/osch/lua-mtstates#mtstates"
license=("MIT")
depends=("lua")
makedepends=("luarocks")
source=("https://github.com/osch/lua-$_pkgluaname/archive/v$pkgver.tar.gz")
package() {
	_luaver=$($_luacmd -e 'io.write(_VERSION:gsub("^.* (.*)$","%1"),"")')
	cd "$srcdir/lua-$_pkgluaname-$pkgver"
	luarocks --lua-version $_luaver --tree="$pkgdir/usr" make "rockspecs/$_pkgluaname-$pkgver-$_rockrel.rockspec"
	mkdir -p "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mv "$pkgdir/usr/lib/luarocks/rocks-"*"/$_pkgluaname/$pkgver-$_rockrel/doc" "$pkgdir/usr/share/doc/$pkgname"
	chmod -R 0644 "$pkgdir/usr/share/doc/$pkgname"/*
	ln -s "../../doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm -rf "$pkgdir/usr/lib/luarocks"
}

md5sums=('f8d92ba4830517808291a5c8b81a7f73')
