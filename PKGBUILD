# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=prompt-style
pkgname=(lua{,51,52,53,54}-"$_pkgname")
pkgver=0.1.0
pkgrel=1
pkgdesc="Lua plugin for powerlevel10k style prompt and WakaTime time tracking"
arch=(any)
url=https://github.com/wakatime/$_pkgname.lua
license=(GPL3)
makedepends=(luarocks)
optdepends=('git: get project name')
_revision=1
source=("https://luarocks.org/manifests/freed-wu/$_pkgname-$pkgver-$_revision.src.rock")
sha256sums=('470b1b4fe14e58fd3e7e0dac5841ab486e23898ee33d7b0f586813f53a5a9f8b')
_lua_version=5.5

_package() {
	install -Dm644 ./*.rock -t $1
	luarocks install --no-manifest --lua-version=$1 --tree="$pkgdir/usr/" --deps-mode=none $1/*.rock
}

package_lua51-prompt-style() {
	# neovim uses lua5.1
	optdepends+=(neovim)
	depends=(lua51-{warna,filesystem,luaprompt,platformdirs})
	_package 5.1
}

package_lua52-prompt-style() {
	depends=(lua52-{warna,filesystem,luaprompt,platformdirs})
	_package 5.2
}

package_lua53-prompt-style() {
	depends=(lua53-{warna,filesystem,luaprompt,platformdirs})
	_package 5.3
}

package_lua54-prompt-style() {
	depends=(lua54-{warna,filesystem,luaprompt,platformdirs})
	_package 5.4
}

package_lua-prompt-style() {
	# pandoc, neomutt uses lua5.4
	optdepends+=(pandoc-cli neomutt)
	depends=(lua-{warna,filesystem,luaprompt,platformdirs})
	_package $_lua_version
}
