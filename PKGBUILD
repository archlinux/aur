# Maintainer: osch <oliver@luced.de>

_pkgluaname=mtint
_luacmd="lua"
_rockrel=1
pkgname=lua-$_pkgluaname
pkgver=0.3.3
pkgrel=1
pkgdesc="Make Lua threads and coroutines interruptible in arbitrary multi-threading scenarios."
arch=("i686" "x86_64")
url="https://github.com/osch/lua-mtint#mtint"
license=("MIT")
depends=("lua")
makedepends=("luarocks")
source=("https://github.com/osch/$pkgname/archive/v$pkgver.tar.gz")
package() {
	_luaver=$($_luacmd -e 'io.write(_VERSION:gsub("^.* (.*)$","%1"),"")')
	cd "$srcdir/$pkgname-$pkgver"
	luarocks --lua-version $_luaver --tree="$pkgdir/usr" make "rockspecs/$_pkgluaname-$pkgver-$_rockrel.rockspec"
	mkdir -p "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mv "$pkgdir/usr/lib/luarocks/rocks-"*"/$_pkgluaname/$pkgver-$_rockrel/doc" "$pkgdir/usr/share/doc/$pkgname"
	chmod -R 0644 "$pkgdir/usr/share/doc/$pkgname"/*
	ln -s "../../doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm -rf "$pkgdir/usr/lib/luarocks"
}

md5sums=('6cf32fb78885b3ce92edfb47106f35f6')
