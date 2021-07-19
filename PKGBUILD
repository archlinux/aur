# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=cassowary
_project=$_rockname.lua
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=2.3.1
_rockrel=1
pkgrel=1
pkgdesc='The cassowary constraint solver'
arch=(any)
url="https://github.com/sile-typesetter/$_project"
license=(MIT)
_lua_deps=(penlight)
makedepends=(lua lua53 lua52 lua51 luarocks)
source=("$_rockname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1cdf42d8736ac39becef7d0ff635317e1b0952968c9c8a5a2755a25aed17499a')

_package_helper() {
	cd "$_project-$pkgver"
	luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "rockspecs/$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-cassowary() {
	depends=('lua' "${_lua_deps[@]/#/lua-}")
	_package_helper 5.4
}

package_lua53-cassowary() {
	depends=('lua53' "${_lua_deps[@]/#/lua53-}")
	_package_helper 5.3
}

package_lua52-cassowary() {
	depends=('lua52' "${_lua_deps[@]/#/lua52-}")
	_package_helper 5.2
}

package_lua51-cassowary() {
	depends=('lua51' "${_lua_deps[@]/#/lua51-}")
	_package_helper 5.1
}
