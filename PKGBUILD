# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stephen Smith <stephen304@gmail.com>

_rockname=bit32
pkgname=("lua-$_rockname" "lua51-$_rockname" "lua52-$_rockname")
pkgbase=lua-$_rockname
pkgver=5.3.0
pkgrel=3
pkgdesc="Lua 5.2 bit manipulation library"
arch=('i686' 'x86_64')
url="http://www.lua.org/manual/5.2/manual.html#6.7"
license=('MIT')
makedepends=('luarocks')
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/keplerproject/lua-compat-5.2/archive/bitlib-${pkgver}.tar.gz")
sha256sums=('dc1197b9e996b7bd2c6a679b86ed75106d5722424b3e731b8084f56626ec5552')

_package_helper() {
  _lua_ver=$1

  mkdir -p "$_lua_ver"
  cd "lua-compat-5.2-bitlib-$pkgver"
  luarocks make --pack-binary-rock --deps-mode=none "rockspecs/$_rockname-$pkgver-1.rockspec"
  mv *.rock ../${_lua_ver}/
  luarocks install --tree="$pkgdir/usr/" --deps-mode=none ../${_lua_ver}/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package_lua51-bit32() {
  depends+=('lua51')

  _package_helper "5.1"
}

package_lua52-bit32() {
  depends+=('lua52')

  _package_helper "5.2"
}

package_lua-bit32() {
  depends+=('lua')

  _package_helper "5.3"
}
