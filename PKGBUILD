# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=lua-grail
_rockname=${pkgbase#lua-}
pkgname=("$pkgbase" "lua51-$_rockname" "lua52-$_rockname" "lua53-$_rockname")
pkgver=1.0.0
_rockrel=1
pkgrel=1
pkgdesc='a small Lua graphics library that lets you draw lines, polygons and curves'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
_luadeps=(penlight
          rough)
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('e5e9ce5ba84afa25442836e2230e522cfc1bd50348c21ce5adb903796c3c1244')

_package() {
	cd "$_archive"
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

package_lua-grail() {
	depends=("${_luadeps[@]/#/${pkgname%-*}-}")
	_package 5.4
}

package_lua51-grail() {
	depends=("${_luadeps[@]/#/${pkgname%-*}-}")
	_package 5.1
}

package_lua52-grail() {
	depends=("${_luadeps[@]/#/${pkgname%-*}-}")
	_package 5.2
}

package_lua53-grail() {
	depends=("${_luadeps[@]/#/${pkgname%-*}-}")
	_package 5.3
}
