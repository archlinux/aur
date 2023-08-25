# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=prompt-style
pkgname=(lua{,51,52,53}-"$_pkgname")
pkgver=0.0.1
pkgrel=1
pkgdesc="powerlevel10k style for luaprompt"
arch=(any)
url=https://github.com/Freed-Wu/$_pkgname.lua
license=(GPL3)
makedepends=(luarocks)
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver-0.all.rock")
sha256sums=('62c52906b18c43ebb1db35648f6095a512534a13f6e3bdeaac6765802478376d')
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
	local version=5.1
	_package $version
	rm -r "${pkgdir:?}/usr/bin"
	install -D "$pkgdir/usr/lib/luarocks/rocks-$version/prompt-style/$pkgver-0/bin/nvimp" -t "$pkgdir/usr/bin"
}

package_lua52-prompt-style() {
	depends=(lua52-ansicolors lua52-filesystem)
	local version=5.2
	_package $version
	rm -r "${pkgdir:?}/usr/bin"
}

package_lua53-prompt-style() {
	# luatex, neomutt uses lua5.3
	optdepends=(lua53-luaprompt texlive-bin neomutt)
	depends=(lua53-ansicolors lua53-filesystem)
	local version=5.3
	_package $version
	rm -r "${pkgdir:?}/usr/bin"
	install -D "$pkgdir/usr/lib/luarocks/rocks-$version/prompt-style/$pkgver-0/bin/"{texluap,neomuttp} -t "$pkgdir/usr/bin"
}

package_lua-prompt-style() {
	# pandoc uses lua5.4
	optdepends=(lua51-luaprompt pandoc-cli)
	depends=(lua-ansicolors lua-filesystem)
	local version=$_lua_version
	_package $version
	rm -r "${pkgdir:?}/usr/bin"
	install -D "$pkgdir/usr/lib/luarocks/rocks-$version/prompt-style/$pkgver-0/bin/pandocp" -t "$pkgdir/usr/bin"
}
