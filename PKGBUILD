# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=('lua-jsonrpc4lua' 'lua51-jsonrpc4lua' 'lua52-jsonrpc4lua')
pkgbase=lua-jsonrpc4lua
_rockname=jsonrpc4lua
pkgver=1.0.1
pkgrel=1
pkgdesc="A very basic JSON RPC client and server-side module. This repository is a fork of the original craigmj/json4lua repository with bug fixes and the switch to lua-cjson for JSON encoding and decoding."
arch=('i686' 'x86_64')
url="https://github.com/pdxmeshnet/jsonrpc4lua"
license=('GPL')
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/pdxmeshnet/${_rockname}/archive/${pkgver}.tar.gz")
md5sums=('7b885a8d07bbcc84f7380cd1e9e32016')

_package_helper() {
  _lua_ver=$1

  mkdir -p "$_lua_ver"
  cd "$_rockname-$pkgver"
  luarocks-${_lua_ver} make --pack-binary-rock --deps-mode=none "$_rockname-$pkgver-1.rockspec"
  mv *.rock ../${_lua_ver}/
  luarocks-${_lua_ver} install --tree="$pkgdir/usr/" --deps-mode=none ../${_lua_ver}/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package_lua51-jsonrpc4lua() {
  depends=('lua51' 'lua51-socket' 'lua51-cgilua-git' 'lua51-cjson' 'luarocks5.1')
  optdepends=('lua51-xavante: Optional requirement to run the server-side example')

  _package_helper "5.1"
}

package_lua52-jsonrpc4lua() {
  depends=('lua52' 'lua52-socket' 'lua52-cgilua-git' 'lua52-cjson' 'luarocks5.2')
  optdepends=('lua52-xavante: Optional requirement to run the server-side example')

  _package_helper "5.2"
}

package_lua-jsonrpc4lua() {
  depends=('lua' 'lua-socket' 'lua-cgilua-git' 'lua-cjson' 'luarocks')
  optdepends=('lua-xavante: Optional requirement to run the server-side example')

  _package_helper "5.3"
}
