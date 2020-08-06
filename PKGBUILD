# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=cldr
_project=$_rockname-lua
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.0.0
_rockrel=0
pkgrel=8
pkgdesc='Unicode CLDR data and Lua interface'
arch=('any')
url="https://github.com/alerque/$_project"
license=('MIT')
_lua_deps=('penlight')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('03cc703e4d8874cb2b94871fa69daa467e4c0fa44e39787e6c02375bfe2b911e')

_package_helper() {
  cd "$_project-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_rockname-scm-$_rockrel.rockspec"
}

package_lua-cldr() {
  depends=('lua' "${_lua_deps[@]/#/lua-}")
  _package_helper 5.4
}

package_lua53-cldr() {
  depends=('lua53' "${_lua_deps[@]/#/lua53-}")
  _package_helper 5.3
}

package_lua52-cldr() {
  depends=('lua52' "${_lua_deps[@]/#/lua52-}")
  _package_helper 5.2
}

package_lua51-cldr() {
  depends=('lua51' "${_lua_deps[@]/#/lua51-}")
  _package_helper 5.1
}
