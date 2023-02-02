pkgbase=lua-shell
_rockname=${pkgbase#lua-}
_project="${pkgbase//-}"
pkgname=("lua-$_rockname" "lua51-$_rockname" "lua52-$_rockname" "lua53-$_rockname")
pkgver=0.4
_rockrel=1
pkgrel=1
pkgdesc='Lua terminal screen manipulation library'
arch=(any)
url="https://github.com/mna/$_project"
license=(GPL2)
makedepends=(lua
	         lua51
	         lua52
	         lua53
	         luarocks)
_archive="$_project-$pkgver"
source=("$_rockname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('12d5d1e980b3b1ca5d2f8dcc47cccb77ba91234f5459bf11d062ab27fc05e749')

_package() {
cd "$_archive"
depends=("${pkgname%-*}" "${pkgname%-*}-posix")
luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
		 make --deps-mode=none --no-manifest "$_archive-$_rockrel.rockspec"
}

package_lua-shell() {
_package 5.4
}

package_lua51-shell() {
_package 5.1
}

package_lua52-shell() {
_package 5.2
}

package_lua53-shell() {
_package 5.3
}
