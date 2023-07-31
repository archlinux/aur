# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=prompt-style
pkgname=(lua{,51,52,53}-$_pkgname)
pkgver=0.0.1
pkgrel=1
pkgdesc="powerlevel10k style for luaprompt"
arch=(any)
url=https://github.com/Freed-Wu/$_pkgname.lua
license=(GPL3)
makedepends=(luarocks)
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver-0.all.rock")
sha256sums=('ce50c187cf7bf1c4161bd776ec226ca212873387f85681e1f0da75625159d2be')
_lua_version=5.4

_package() {
	install -Dm644 ./*.rock -t $1
	if [[ $1 != $_lua_version ]]; then
		depends=(lua${1/\./}-ansicolors lua${1/\./}-filesystem lua${1/\./}-luaprompt)
	else
		depends=(lua-ansicolors lua-filesystem lua-luaprompt)
	fi
	luarocks install --lua-version=$1 --tree="$pkgdir/usr/" --deps-mode=none $1/*.rock
	rm $pkgdir/usr/lib/luarocks/rocks-*/manifest
}

package_lua51-prompt-style() {
	_package 5.1
}

package_lua52-prompt-style() {
	_package 5.2
}

package_lua53-prompt-style() {
	_package 5.3
}

package_lua-prompt-style() {
	_package $_lua_version
}
