# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=('lua-wsapi' 'lua51-wsapi' 'lua52-wsapi')
pkgbase=lua-wsapi
_rockname=wsapi
pkgver=1.7
pkgrel=1
pkgdesc="WSAPI is an API that abstracts the web server from Lua web applications."
arch=('i686' 'x86_64')
url="http://keplerproject.github.com/wsapi"
license=('MIT')
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/keplerproject/${_rockname}/archive/v${pkgver}.tar.gz")
md5sums=('aacadf9dabeb82b044cb3f1006c5df0d')

_package_helper() {
  _lua_ver=$1

  mkdir -p "$_lua_ver"
  cd "$_rockname-$pkgver"
  luarocks-${_lua_ver} make --pack-binary-rock --deps-mode=none "rockspec/$_rockname-$pkgver-1.rockspec"
  mv *.rock ../${_lua_ver}/

  luarocks-${_lua_ver} install --tree="$pkgdir/usr/" --deps-mode=none ../${_lua_ver}/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package_lua51-wsapi() {
  depends=('lua51' 'lua51-filesystem' 'lua51-rings' 'lua51-coxpcall' 'luarocks5.1')

  _package_helper "5.1"
}

package_lua52-wsapi() {
  depends=('lua52' 'lua52-filesystem' 'lua52-rings' 'lua52-coxpcall' 'luarocks5.2')

  _package_helper "5.2"
}

package_lua-wsapi() {
  depends=('lua' 'lua-filesystem' 'lua-rings' 'lua-coxpcall' 'luarocks')

  _package_helper "5.3"
}
