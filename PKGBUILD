# Maintainer: Caleb Maclennan <caleb@alerque.com>

_luaname=epnf
_rockname=lua$_luaname
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
_pkgname=lua-$_rockname
pkgver=0.3
_rockrel=2
pkgrel=6
pkgdesc='Extended PEG Notation Format (easy grammars for LPeg)'
arch=('i686' 'x86_64')
url="https://siffiejoe.github.com/$_pkgname"
license=('MIT')
_lua_deps=('lpeg')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::https://github.com/siffiejoe/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('57c0ad1917e45c5677bfed0f6122da2baff98117aba05a5e987a0238600f85f9')

prepare() {
  cd "$_pkgname-$pkgver"
  sed -i -e '/< 5.4/s/,.*"/"/' "$_rockname-scm-0.rockspec"
}

_package_helper() {
  cd "$_pkgname-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_rockname-scm-0.rockspec"
}

package_lua-luaepnf() {
  depends=('lua' "${_lua_deps[@]/#/lua-}")
  provides=("lua-$_luaname")
  _package_helper 5.4
}

package_lua53-luaepnf() {
  depends=('lua53' "${_lua_deps[@]/#/lua53-}")
  provides=("lua-$_luaname")
  _package_helper 5.3
}

package_lua52-luaepnf() {
  depends=('lua52' "${_lua_deps[@]/#/lua52-}")
  provides=("lua-$_luaname")
  _package_helper 5.2
}

package_lua51-luaepnf() {
  depends=('lua51' "${_lua_deps[@]/#/lua51-}")
  provides=("lua-$_luaname")
  _package_helper 5.1
}
