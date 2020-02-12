# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=formatter
pkgname="lua51-$_rockname"
pkgver=0.1.1
_rockrel=1
pkgrel=2
pkgdesc='Beautifies Lua code'
arch=('i686' 'x86_64')
url='https://github.com/LuaDevelopmentTools/luaformatter'
license=('GPL')
_lua_deps=('checks' 'metalua-compiler' 'penlight')
depends=('lua51' "${_lua_deps[@]/#/lua51-}")
makedepends=('luarocks')
source=("$pkgname-$pkgver-$_rockrel.tar.gz::https://github.com/LuaDevelopmentTools/luaformatter/archive/v$pkgver-$_rockrel.tar.gz")
sha256sums=('77883b9d7322d55d61366e88baf1483a0e4871cdc38b449a3fa3fa33cd157ec5')

package() {
  cd "lua$_rockname-$pkgver-$_rockrel"
  luarocks --lua-version=5.1 --tree="$pkgdir/usr/" make --deps-mode=none --no-manifest "luarocks/$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##" {} \;
}
