# Maintainer: osch <oliver@luced.de>

_pkgluaname=mtmsg
pkgname=lua53-$_pkgluaname
pkgver=0.4.1
_luacmd="lua5.3"
pkgrel=1
_rockrel=1
pkgdesc="Low-level in-memory message buffers for inter-thread communication for Lua."
arch=("i686" "x86_64")
url="https://github.com/osch/lua-mtmsg#mtmsg"
license=("MIT")
depends=("lua53")
makedepends=("luarocks")
source=("https://github.com/osch/lua-$_pkgluaname/archive/v$pkgver.tar.gz")
package() {
	_luaver=$($_luacmd -e 'io.write(_VERSION:gsub("^.* (.*)$","%1"),"")')
	cd "$srcdir/lua-mtmsg-$pkgver"
	luarocks --lua-version $_luaver --tree="$pkgdir/usr" make "rockspecs/$_pkgluaname-$pkgver-$_rockrel.rockspec"
	mkdir -p "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mv "$pkgdir/usr/lib/luarocks/rocks-"*"/$_pkgluaname/$pkgver-$_rockrel/doc" "$pkgdir/usr/share/doc/$pkgname"
	chmod -R 0644 "$pkgdir/usr/share/doc/$pkgname"/*
	ln -s "../../doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm -rf "$pkgdir/usr/lib/luarocks"
}

md5sums=('57f8741a3cfbf3f030cefd3d98d12c08')
