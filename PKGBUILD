# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgbase=lua-posix
_rockname=${pkgbase#lua-}
_pkgbase="${pkgbase//-}"
pkgname=("$pkgbase" "lua51-$_rockname" "lua52-$_rockname" "lua53-$_rockname")
pkgver=35.1
_rockrel=1
pkgrel=2
pkgdesc='POSIX bindings for Lua'
arch=(x86_64 i686)
url="https://github.com/$_pkgbase/$_pkgbase"
license=(MIT)
_luadeps=(std-normalize)
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
_archive="$_pkgbase-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1b5c48d2abd59de0738d1fc1e6204e44979ad2a1a26e8e22a2d6215dd502c797')

_package() {
	cd "$_archive"
	luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

package_lua-posix() {
	depends=("${pkgname%-*}" "${_luadeps[@]/#/${pkgname%-*}-}")
	_package 5.4
}

package_lua51-posix() {
	depends=("${pkgname%-*}" "${_luadeps[@]/#/${pkgname%-*}-}")
	_package 5.1
}

package_lua52-posix() {
	depends=("${pkgname%-*}" "${_luadeps[@]/#/${pkgname%-*}-}")
	_package 5.2
}

package_lua53-posix() {
	depends=("${pkgname%-*}" "${_luadeps[@]/#/${pkgname%-*}-}")
	_package 5.3
}
