# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=pegdebug
_pkgname=PegDebug
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.41
_rockrel=1
pkgrel=5
pkgdesc='Trace debugger for LPeg rules and captures'
arch=(i686 x86_64)
url="https://github.com/pkulchenko/$_pkgname"
license=(MIT)
_luadeps=(lpeg)
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('0ba8c5ee25cf24e011b29d40cfa5577b19cb4d9d8a086e9238187e7831fb39d1')

_package() {
	cd "$_archive"
	depends=("${pkgname%-*}" "${_luadeps[@]/#/${pkgname%-*}-}")
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest -- "misc/$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-pegdebug() {
	_package 5.4
}

package_lua51-pegdebug() {
	_package 5.1
}

package_lua52-pegdebug() {
	_package 5.2
}

package_lua53-pegdebug() {
	_package 5.3
}
