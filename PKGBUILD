# Maintainer: Stephen Smith <stephen304@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=copas
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=2.0.2
_rockrel=1
pkgrel=3
pkgdesc='A dispatcher based on coroutines that can be used by TCP/IP servers'
arch=('x86_64' 'i686')
url="https://keplerproject.github.io/$_rockname"
license=('MIT')
_lua_deps=('socket' 'coxpcall')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::https://github.com/keplerproject/$_rockname/archive/$pkgver.tar.gz")
sha256sums=('1469eaf987513f5a9a0bee345c040c8fa30ca6194bc75ad78171362f9904cf3e')

_package_helper() {
  cd "$_rockname-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest \
    "rockspec/$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-copas() {
  depends+=('lua' "${_lua_deps[@]/#/lua-}")
  _package_helper 5.4
}

package_lua53-copas() {
  depends+=('lua53' "${_lua_deps[@]/#/lua53-}")
  _package_helper 5.3
}

package_lua52-copas() {
  depends+=('lua52' "${_lua_deps[@]/#/lua52-}")
  _package_helper 5.2
}

package_lua51-copas() {
  depends+=('lua51' "${_lua_deps[@]/#/lua51-}")
  _package_helper 5.1
}
