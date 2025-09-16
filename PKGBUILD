# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
_pkgname=native-objects
pkgname=(lua{,51,52,53}-"$_pkgname")
pkgver=0.5
pkgrel=1
pkgdesc="A Lua bindings generator written in Lua"
arch=(any)
url=https://github.com/Neopallium/LuaNativeObjects
license=(MIT)
makedepends=(luarocks)
_revision=1
source=("https://luarocks.org/manifests/neopallium/luanativeobjects-$pkgver-1.src.rock")
sha256sums=('86fa6f7e2608800946a171eb809334affdf85a38bad8b7ab505fb618e9f932c4')
_lua_version=5.4

_package() {
	optdepends=("lua${1/./}-$_pkgname")
	luarocks install --no-manifest --lua-version=$1 --tree="$pkgdir/usr/" --deps-mode=none ./*.rockspec
	rm -r "${pkgdir:?}/usr/bin"
	local version="$1"
	local v
	if [[ "$version" != "$_lua_version" ]]; then
		v="$version"
	fi
	install -D "$pkgdir/usr/lib/luarocks/rocks-$version/luanativeobjects/$pkgver-$_revision/bin/"native_objects "$pkgdir/usr/bin/native_objects$v"
	if [[ "$version" != "$_lua_version" ]]; then
		sed -i '1s/$/'"$v"/ "$pkgdir/usr/bin/native_objects$v"
	fi
}

package_lua51-native-objects() {
	_package 5.1
}

package_lua52-native-objects() {
	_package 5.2
}

package_lua53-native-objects() {
	_package 5.3
}

package_lua-native-objects() {
	_package $_lua_version
}
# ex: nowrap
