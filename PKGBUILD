_rockname=getch
_project=lua-$_rockname
pkgname=("lua-$_rockname" "lua51-$_rockname" "lua52-$_rockname" "lua53-$_rockname")
pkgver=0.0
_rockrel=4
pkgrel=1
pkgdesc='Lua module provides a way to get raw Keyboard data'
arch=(any)
url="https://github.com/max1220/$_project"
license=(MIT)
_luadeps=(bit32)
makedepends=(lua
	         lua51
	         lua52
	         lua53
	         luarocks)
_archive="$_project-$pkgver-$_rockrel"
source=("$_rockname-$pkgver.tar.gz::$url/archive/$pkgver-$_rockrel.tar.gz")
sha256sums=('dc83993e3a8047f391c418a20d9dac47f7547f36e8cbb6c0ee986ee4363b2ac4')

_package() {
cd "$_archive"
depends=("${pkgname%-*}" "${_luadeps[@]/#/${pkgname%-*}-}")
luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
		 make --deps-mode=none --no-manifest "$_archive.rockspec"
}

package_lua-getch() {
_package 5.4
}

package_lua51-getch() {
_package 5.1
}

package_lua52-getch() {
_package 5.2
}

package_lua53-getch() {
_package 5.3
}
