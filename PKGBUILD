# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=cldr
_project=$_rockname-lua
pkgname=("lua-$_rockname" "lua51-$_rockname" "lua52-$_rockname" "lua53-$_rockname")
pkgver=0.2.0
_rockrel=0
pkgrel=1
pkgdesc='Lua interface to Unicode CLDR data'
arch=(any)
url="https://github.com/alerque/$_project"
license=(MIT custom:ICU)
_luadeps=(penlight)
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
_archive="$_project-$pkgver"
source=("$_rockname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9e7ac91fec23fea571d08d5663145842d463d0778967ff6f6fa29cc621647aa9')

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
