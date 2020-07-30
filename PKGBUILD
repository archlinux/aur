# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=cluacov
pkgname=("lua-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.1.1
pkgrel=1
pkgdesc='C extensions for LuaCov'
arch=('x86_64' 'i686')
url="https://github.com/mpeterv/$_rockname"
license=('MIT')
depends=('lua')
_lua_deps=('luacov')
makedepends=('lua' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('fc46a69fbd9be19e022b05be252d2b2c41a4fb1799ddf41c7d325d260bc77c14')

_package_helper() {
  cd "$_rockname-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest
}

package_lua-cluacov() {
  depends=('lua' "${_lua_deps[@]/#/lua-}")
  _package_helper 5.3
}

package_lua52-cluacov() {
  depends=('lua52' "${_lua_deps[@]/#/lua52-}")
  _package_helper 5.2
}

package_lua51-cluacov() {
  depends=('lua51' "${_lua_deps[@]/#/lua51-}")
  _package_helper 5.1
}
