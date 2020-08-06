# Maintainer: osch <oliver@luced.de>

pkgluaname=mtmsg
pkgname=lua-$pkgluaname
pkgver=0.4.1
_luacmd="lua"
pkgrel=1
_rockrel=1
pkgdesc="Low-level in-memory message buffers for inter-thread communication for Lua."
arch=("i686" "x86_64")
url="https://github.com/osch/lua-mtmsg#mtmsg"
license=("MIT")
depends=("lua")
makedepends=("luarocks")
source=("https://github.com/osch/$pkgname/archive/v$pkgver.tar.gz")
package() {
	_luaver=$($_luacmd -e 'io.write(_VERSION:gsub("^.* (.*)$","%1"),"")')
	cd "$srcdir/$pkgname-$pkgver"
	luarocks --lua-version $_luaver --tree="$pkgdir/usr" make "rockspecs/$pkgluaname-$pkgver-$_rockrel.rockspec"
	mkdir -p "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mv "$pkgdir/usr/lib/luarocks/rocks-"*"/$pkgluaname/$pkgver-$_rockrel/doc" "$pkgdir/usr/share/doc/$pkgname"
	chmod -R 0644 "$pkgdir/usr/share/doc/$pkgname"/*
	ln -s "../../doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm -rf "$pkgdir/usr/lib/luarocks"
}

md5sums=('57f8741a3cfbf3f030cefd3d98d12c08')
