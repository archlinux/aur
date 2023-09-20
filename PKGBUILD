# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stephen Smith <stephen304@gmail.com>

_rockname=copas
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=4.7.0
_rockrel=1
pkgrel=2
pkgdesc='A dispatcher based on coroutines that can be used by TCP/IP servers'
arch=(x86_64 i686)
url="https://lunarmodules.github.io/$_rockname"
_url="https://github.com/lunarmodules/$_rockname"
license=('MIT')
_lua_deps=(coxpcall
           socket)
makedepends=(lua
             lua53
             lua52
             lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$_url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('54c16a5f56ff32f3a6c9410f5927c33156c81fde035772e5adc6404565ed3d3a')

_package_helper() {
	cd "$_archive"
	luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest \
		"rockspec/$_archive-$_rockrel.rockspec"
	if [[ $1 != 5.4 ]]; then
		rm -f $pkgdir/usr/bin/$_rockname
	fi
}

package_lua-copas() {
	depends+=(lua "${_lua_deps[@]/#/lua-}")
	_package_helper 5.4
}

package_lua53-copas() {
	depends+=(lua53 "${_lua_deps[@]/#/lua53-}")
	_package_helper 5.3
}

package_lua52-copas() {
	depends+=(lua52 "${_lua_deps[@]/#/lua52-}")
	_package_helper 5.2
}

package_lua51-copas() {
	depends+=(lua51 "${_lua_deps[@]/#/lua51-}")
	_package_helper 5.1
}
