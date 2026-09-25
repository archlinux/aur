# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=vim
pkgname=(lua{,51,52,53,54}-"$_pkgname")
pkgver=0.0.11
pkgrel=1
pkgdesc="use vim.fs outside of neovim"
arch=(any)
url=https://github.com/rimeinn/rime.nvim/tree/main/packages/vim
license=(GPL3)
makedepends=(luarocks)
_revision=1
source=("https://luarocks.org/manifests/freed-wu/vim-$pkgver-$_revision.src.rock")
sha256sums=('23812e4fe4eb1fa3dbde0a6803b7bc4e6bcb958dc0927b65523d4a7739562f21')
_lua_version=5.5

_package() {
	install -Dm644 ./*.rock -t $1
	luarocks install --no-manifest --lua-version=$1 --tree="$pkgdir/usr/" --deps-mode=none $1/*.rock
}

package_lua51-vim() {
	depends=(lua51-filesystem)
	_package 5.1
}

package_lua52-vim() {
	depends=(lua52-filesystem)
	_package 5.2
}

package_lua53-vim() {
	depends=(lua53-filesystem)
	_package 5.3
}

package_lua54-vim() {
	local version=
	depends=(lua54-filesystem)
	_package 5.4
}

package_lua-vim() {
	depends=(lua-filesystem)
	local version=$_lua_version
	_package $version
}
