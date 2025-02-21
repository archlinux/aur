# Maintainer: Sol Bekic <s+aur at s-ol dot nu>

_rockname=losc
pkgbase=lua-$_rockname
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=1.0.1
_rockrel=1
_pkgref=12691509e066eded1a2c9fbf480b68ba9b697c2a
pkgrel=1
pkgdesc='Open Sound Control (OSC) for lua/luajit'
arch=(any)
url="https://github.com/davidgranstrom/losc"
license=(MIT)
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
_archive="$_rockname-$pkgver"
source=("https://github.com/davidgranstrom/$_rockname/archive/$_pkgref.tar.gz")
sha256sums=('8c661506b5b65affbcbd5987aebeaa82bdbe3660a0e6783f1a72743951824d82')

_package() {
	cd "$_rockname-$_pkgref"
	luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "rockspecs/$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	if [[ $pkgname != lua-$_rockname ]]; then
		rm -rf "$pkgdir/usr/bin"
	else
		find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##g" {} \;
	fi
}

package_lua-losc() {
	_package 5.4
	depends=(lua)
}

package_lua51-losc() {
	_package 5.1
	depends=(lua51)
}

package_lua52-losc() {
	_package 5.2
	depends=(lua52)
}

package_lua53-losc() {
	_package 5.3
	depends=(lua53)
}
