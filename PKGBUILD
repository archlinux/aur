# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=vim
pkgname=(lua{,51,52,53}-"$_pkgname")
pkgver=0.0.7
pkgrel=1
pkgdesc="use vim.fs outside of neovim"
arch=(any)
url=https://github.com/rimeinn/rime.nvim/tree/main/packages/vim
license=(GPL3)
makedepends=(luarocks)
_revision=2
source=("https://luarocks.org/manifests/freed-wu/vim-$pkgver-1.src.rock")
sha256sums=('81c08045b14506c68c8c5f0e6684fed20c7820350a945cdffe253a6be23ecf79')
_lua_version=5.4

_package() {
	install -Dm644 ./*.rock -t $1
	luarocks install --no-manifest --lua-version=$1 --tree="$pkgdir/usr/" --deps-mode=none $1/*.rock
}

package_lua51-vim() {
	local version=5.1
	depends=(lua51-filesystem)
	_package $version
}

package_lua52-vim() {
	local version=5.2
	depends=(lua52-filesystem)
	_package $version
}

package_lua53-vim() {
	local version=5.3
	depends=(lua53-filesystem)
	_package $version
}

package_lua-vim() {
	depends=(lua-filesystem)
	local version=$_lua_version
	_package $version
}
