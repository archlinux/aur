# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

_rockname=posix
pkgbase=lua-$_rockname
_pkgbase="${pkgbase//-}"
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=35.0
_rockrel=1
pkgrel=2
pkgdesc='POSIX bindings for Lua'
arch=(x86_64 i686)
url="https://github.com/$_pkgbase/$_pkgbase"
license=(MIT)
_lua_deps=(std-normalize)
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
source=("$_pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a4edf2f715feff65acb009e8d1689e57ec665eb79bc36a6649fae55eafd56809')

_package_helper() {
	cd "$_pkgbase-$pkgver"
	luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_pkgbase-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

package_lua-posix() {
	depends+=(lua "${_lua_deps[@]/#/lua-}")
	_package_helper 5.4
}

package_lua53-posix() {
	depends+=(lua53 "${_lua_deps[@]/#/lua53-}")
	_package_helper 5.3
}

package_lua52-posix() {
	depends+=(lua52 "${_lua_deps[@]/#/lua52-}")
	_package_helper 5.2
}

package_lua51-posix() {
	depends+=(lua51 "${_lua_deps[@]/#/lua51-}")
	_package_helper 5.1
}
