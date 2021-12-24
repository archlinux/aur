# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=fluent
_project=$_rockname-lua
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.0.5
_rockrel=0
pkgrel=1
pkgdesc='Lua implementation of Project Fluent'
arch=(any)
url="https://github.com/alerque/$_project"
license=(MIT)
_lua_deps=(cldr
           luaepnf
           penlight)
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
_archive="$_project-$pkgver"
source=("$_archive.tgz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ac48a86e752d811da063da6a9f2632f359bb798b31ab1d55e5b48aab53398ac5')

_package_helper() {
	cd "$_archive"
	luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-dev-$_rockrel.rockspec"
}

package_lua-fluent() {
	depends=(lua "${_lua_deps[@]/#/lua-}")
	_package_helper 5.4
}

package_lua51-fluent() {
	depends=(lua51 "${_lua_deps[@]/#/lua51-}")
	_package_helper 5.1
}

package_lua52-fluent() {
	depends=(lua52 "${_lua_deps[@]/#/lua52-}")
	_package_helper 5.2
}

package_lua53-fluent() {
	depends=(lua53 "${_lua_deps[@]/#/lua53-}")
	_package_helper 5.3
}
