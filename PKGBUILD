# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=luarocks-build-rust-mlua
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.2.0
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
sha256sums=('0d0be64b4777222aea91b0e88bfe1d5a12bf40a6a2e7e1a1b86de58786f0412c')

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
