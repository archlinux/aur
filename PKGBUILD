# Contributor: strata <strata@dropswitch.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: osch <oliver@luced.de>
pkgname=lrexlib-posix
pkgver=2.9.1
pkgrel=1
_rockrel=1
pkgdesc="Regular expression library for Lua - POSIX version"
arch=('i686' 'x86_64')
url="https://luarocks.org/modules/rrt/$pkgname"
license=('custom')
depends=('lua')
makedepends=('luarocks')
source=(
	"https://luarocks.org/$pkgname-$pkgver-$_rockrel.src.rock"
)
noextract=(
	"$pkgname-$pkgver-$_rockrel.src.rock"
)

package() {
	_luaver=$(lua -e 'io.write(_VERSION:gsub("^.* (.*)$","%1"),"")')
	luarocks --lua-version $_luaver --tree="$pkgdir/usr" install "$pkgname-$pkgver-$_rockrel.src.rock"

	mkdir -p "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mv "$pkgdir/usr/lib/luarocks/rocks-"*"/$pkgname/$pkgver-$_rockrel/doc" "$pkgdir/usr/share/doc/$pkgname"
	chmod -R 0644 "$pkgdir/usr/share/doc/$pkgname"/*
	rm -f "$pkgdir/usr/share/doc/$pkgname/.gitignore"
	ln -s "../../doc/$pkgname/license.html" "$pkgdir/usr/share/licenses/$pkgname/license.html"
	rm -rf "$pkgdir/usr/lib/luarocks"
}

md5sums=('f7d6a35960d29e6b97d9038d20252805')
