# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=lua-cldr
_rockname=${pkgbase#lua-}
_project=$_rockname-lua
pkgname=("$pkgbase" "lua51-$_rockname" "lua52-$_rockname" "lua53-$_rockname")
pkgver=0.1.0
_rockrel=0
pkgrel=1
pkgdesc='Unicode CLDR data and Lua interface'
arch=(any)
url="https://github.com/alerque/$_project"
license=(MIT)
_luadeps=(penlight)
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
_archive="$_project-$pkgver"
source=("$_rockname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('633c4fdf60de8eb56d9c019f85ae7ada77b9b45a8153d4ebc1b13129a5d2fbd6')

_package() {
	cd "$_archive"
	depends=("${pkgname%-*}" "${_luadeps[@]/#/${pkgname%-*}-}")
	luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-dev-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

package_lua-cldr() {
	_package 5.4
}

package_lua51-cldr() {
	_package 5.1
}

package_lua52-cldr() {
	_package 5.2
}

package_lua53-cldr() {
	_package 5.3
}
