# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=luarocks-build-rust-mlua
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.1.2
_rockrel=1
pkgrel=1
pkgdesc='A LuaRocks build backend for Lua modules written in Rust using mlua'
arch=(any)
url="https://github.com/khvzak/$_rockname"
license=(MIT)
depends=(cargo)
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('589907b1ad6823922d87742ac235f83d67cd63662ab045fd004a6328feba795f')

_package_helper() {
	cd "$_archive"
	luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-luarocks-build-rust-mlua() {
	depends=(lua "${_luadeps[@]/#/lua-}")
	_package_helper 5.4
}

package_lua51-luarocks-build-rust-mlua() {
	depends=(lua51 "${_luadeps[@]/#/lua51-}")
	_package_helper 5.1
}

package_lua52-luarocks-build-rust-mlua() {
	depends=(lua52 "${_luadeps[@]/#/lua52-}")
	_package_helper 5.2
}

package_lua53-luarocks-build-rust-mlua() {
	depends=(lua53 "${_luadeps[@]/#/lua53-}")
	_package_helper 5.3
}
