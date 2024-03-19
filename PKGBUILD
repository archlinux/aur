# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=luacov
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.15.0
_rockrel=1
pkgrel=1
pkgdesc='Coverage analysis tool for Lua scripts'
arch=(x86_64 i686)
url="https://keplerproject.github.io/$_rockname"
license=(MIT)
makedepends=(lua
             lua53
             lua52
             lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("https://github.com/keplerproject/$_rockname/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('19ebe0fdd5dd05ab63d5192371dcf272f2c7ccea5366e98fee440a2f30e021d8')

_package() {
	cd "$_archive"
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "$_rockname-scm-$_rockrel.rockspec"
	find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##" {} \;
}

package_lua-luacov() {
	depends+=(lua)
	_package 5.4
}

package_lua53-luacov() {
	depends+=(lua53)
	_package 5.3
	rm "$pkgdir/usr/bin/luacov"
}

package_lua52-luacov() {
	depends+=(lua52)
	_package 5.2
	rm "$pkgdir/usr/bin/luacov"
}

package_lua51-luacov() {
	depends+=(lua51)
	_package 5.1
	rm "$pkgdir/usr/bin/luacov"
}
