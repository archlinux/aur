# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=lunajson
pkgbase="lua-$_rockname"
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=1.2.3
_rockrel=1
pkgrel=1
pkgdesc='A strict and fast JSON parser/decoder/encoder written in pure Lua'
arch=(any)
url="https://github.com/grafi-tt/$_rockname"
license=(MIT)
makedepends=(lua
             lua53
             lua52
             lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('4a4207806864d4a21eb24ddeb026e28efba179440d7c0043482568a7a191ba66')

_package() {
	cd "$_archive"
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

package_lua-lunajson() {
	_package 5.4
}

package_lua53-lunajson() {
	_package 5.3
}

package_lua52-lunajson() {
	_package 5.2
}

package_lua51-lunajson() {
	_package 5.1
}
