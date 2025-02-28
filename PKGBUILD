# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=lua-rough
_rockname=${pkgbase#lua-}
_project=$_rockname-lua
pkgname=("$pkgbase" "lua51-$_rockname" "lua52-$_rockname" "lua53-$_rockname")
pkgver=1.0.0
_rockrel=1
pkgrel=1
pkgdesc='Pure Lua library for creating hand-drawn graphics'
arch=(any)
url="https://github.com/Omikhleia/$_project"
license=(MIT)
_luadeps=(penlight)
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
_archive="$_project-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('3829949ddfcd6b03fc3d651548e2c1370da7a38160489e28d99f181f45c488c6')

_package() {
	cd "$_archive"
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

package_lua-rough() {
	depends=("${_luadeps[@]/#/${pkgname%-*}-}")
	_package 5.4
}

package_lua51-rough() {
	depends=("${_luadeps[@]/#/${pkgname%-*}-}")
	_package 5.1
}

package_lua52-rough() {
	depends=("${_luadeps[@]/#/${pkgname%-*}-}")
	_package 5.2
}

package_lua53-rough() {
	depends=("${_luadeps[@]/#/${pkgname%-*}-}")
	_package 5.3
}
