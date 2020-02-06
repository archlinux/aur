# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=busted
pkgname=("lua-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=2.0.0
_rockrel=1
pkgrel=4
pkgdesc='Elegant Lua unit testing.'
arch=('i686' 'x86_64')
url='https://olivinelabs.com/busted/'
license=('MIT')
_lua_deps=('cliargs' 'dkjson' 'filesystem' 'luassert' 'mediator' 'penlight' 'say' 'system' 'term')
makedepends=('luarocks')
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/Olivine-Labs/$_rockname/archive/v$pkgver.tar.gz")
sha256sums=('fda34db8cd10142d2a88d6df638a7d0874c295fd2bd6338c745cc546dc5847df')

_package_helper() {
  cd "$_rockname-$pkgver"
  luarocks --lua-version=$1 --tree="$pkgdir/usr" install --deps-mode=none --no-manifest "$_rockname-scm-0.rockspec"
}

package_lua-busted() {
  depends+=('lua' "${_lua_deps[@]/#/lua-}")
  _package_helper 5.3
}

package_lua52-busted() {
  depends+=('lua52' "${_lua_deps[@]/#/lua52-}")
  _package_helper 5.2
}

package_lua51-busted() {
  depends+=('lua51' "${_lua_deps[@]/#/lua51-}")
  _package_helper 5.1
}
