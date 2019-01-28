# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=('lua-bit32' 'lua51-bit32' 'lua52-bit32')
pkgbase=lua-bit32
_rockname=bit32
pkgver=5.3.0
pkgrel=1
pkgdesc="Lua 5.2 bit manipulation library"
arch=('i686' 'x86_64')
url="http://www.lua.org/manual/5.2/manual.html#6.7"
license=('MIT')
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/keplerproject/lua-compat-5.2/archive/bitlib-${pkgver}.tar.gz")
md5sums=('f3b9c497654059ba775913ac1fcfb3fc')

_package_helper() {
  _lua_ver=$1

  mkdir -p "$_lua_ver"
  cd "lua-compat-5.2-bitlib-$pkgver"
  luarocks-${_lua_ver} make --pack-binary-rock --deps-mode=none "rockspecs/$_rockname-$pkgver-1.rockspec"
  mv *.rock ../${_lua_ver}/
  luarocks-${_lua_ver} install --tree="$pkgdir/usr/" --deps-mode=none ../${_lua_ver}/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package_lua51-bit32() {
  depends=('lua51' 'luarocks5.1')

  _package_helper "5.1"
}

package_lua52-bit32() {
  depends=('lua52' 'luarocks5.2')

  _package_helper "5.2"
}

package_lua-bit32() {
  depends=('lua' 'luarocks')

  _package_helper "5.3"
}
