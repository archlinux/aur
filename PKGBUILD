# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=prompt-style
pkgname=(lua{,51,52,53}-$_pkgname)
pkgver=0.0.1
pkgrel=2
pkgdesc="powerlevel10k style for luaprompt"
arch=(any)
url=https://github.com/Freed-Wu/$_pkgname.lua
license=(GPL3)
makedepends=(luarocks)
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver-0.all.rock")
sha256sums=('cee9e68988b665210c2224b8db4547068703ed5d874976f7d0968b0099a799c7')
_lua_version=5.4

_package() {
	install -Dm644 ./*.rock -t $1
	luarocks install --lua-version=$1 --tree="$pkgdir/usr/" --deps-mode=none $1/*.rock
	rm $pkgdir/usr/lib/luarocks/rocks-*/manifest
}

package_lua51-prompt-style() {
	# neovim uses lua5.1
	optdepends=(lua51-luaprompt neovim)
	depends=(lua51-ansicolors lua51-filesystem)
	_package 5.1
	rm -r $pkgdir/usr/bin
	install -D $pkgdir/usr/lib/luarocks/rocks-5.1/prompt-style/$pkgver-0/bin/nvimp -t $pkgdir/usr/bin
}

package_lua52-prompt-style() {
	depends=(lua52-ansicolors lua52-filesystem)
	_package 5.2
	rm -r $pkgdir/usr/bin
}

package_lua53-prompt-style() {
	# luatex uses lua5.3
	optdepends=(lua53-luaprompt texlive-bin)
	depends=(lua53-ansicolors lua53-filesystem)
	_package 5.3
	rm -r $pkgdir/usr/bin
	install -D $pkgdir/usr/lib/luarocks/rocks-5.3/prompt-style/$pkgver-0/bin/texluap -t $pkgdir/usr/bin
}

package_lua-prompt-style() {
	depends=(lua-ansicolors lua-filesystem)
	_package $_lua_version
	rm -r $pkgdir/usr/bin
}
