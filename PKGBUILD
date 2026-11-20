# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=lua-lusc_luv
_rockname=${pkgbase#lua-}
pkgname=("$pkgbase" "lua51-$_rockname" "lua52-$_rockname" "lua53-$_rockname" "lua54-$_rockname")
pkgver=4.0.0
_rockrel=1
pkgrel=1
pkgdesc='Structured Async/Concurrency for Lua using Luv'
arch=(any)
url="https://github.com/svermeulen/$_rockname"
license=(MIT)
_luadeps=(luv)
makedepends=(lua
             lua51
             lua52
             lua53
             lua54
             luarocks)
	     _archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('27a4b49dfe52be224c9dcedaf663005e35fe8ce1158f85f36c45f6b78378c9b0')

_package() {
	cd "$_archive"
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

package_lua-lusc_luv() {
	depends=("${_luadeps[@]/#/${pkgname%-*}-}")
	_package 5.5
}

package_lua51-lusc_luv() {
	depends=("${_luadeps[@]/#/${pkgname%-*}-}")
	_package 5.1
}

package_lua52-lusc_luv() {
	depends=("${_luadeps[@]/#/${pkgname%-*}-}")
	_package 5.2
}

package_lua53-lusc_luv() {
	depends=("${_luadeps[@]/#/${pkgname%-*}-}")
	_package 5.3
}

package_lua54-lusc_luv() {
	depends=("${_luadeps[@]/#/${pkgname%-*}-}")
	_package 5.4
}
