# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=luacov-coveralls
pkgbase=lua-$_rockname
pkgname=$pkgbase
pkgver=0.2.3
_rockrel=1
pkgrel=2
pkgdesc='LuaCov reporter for coveralls.io service'
arch=(any)
url="https://github.com/moteus/$_rockname"
license=(MIT)
depends=(lua
         lua-dkjson
         lua-filesystem
         lua-luacov
         lua-path)
makedepends=('luarocks')
conflicts=(lua53-$_rockname)
replaces=(lua53-$_rockname)
_archive="$_rockname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4fc293b3780783f263469d49fb4d17b2151ba2a7693377673d1cb8eb1576d1d3')

package() {
	cd "$_archive"
	luarocks --lua-version=5.4 --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##" {} \;
}
