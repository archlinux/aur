# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=('lua-wsapi-xavante' 'lua51-wsapi-xavante' 'lua52-wsapi-xavante')
pkgbase=lua-wsapi-xavante
_rockname=wsapi-xavante
_reponame=wsapi
pkgver=1.7
pkgrel=1
pkgdesc="WSAPI is an API that abstracts the web server from Lua web applications. This is the rock that contains the Xavante adapter and launcher."
arch=('i686' 'x86_64')
url="http://keplerproject.github.com/wsapi"
license=('MIT')
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/keplerproject/${_reponame}/archive/v${pkgver}.tar.gz")
md5sums=('aacadf9dabeb82b044cb3f1006c5df0d')

_package_helper() {
  _lua_ver=$1

  mkdir -p "$_lua_ver"
  cd "$_reponame-$pkgver"
  luarocks-${_lua_ver} make --pack-binary-rock --deps-mode=none "rockspec/$_rockname-$pkgver-1.rockspec"
  mv *.rock ../${_lua_ver}/

  luarocks-${_lua_ver} install --tree="$pkgdir/usr/" --deps-mode=none ../${_lua_ver}/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package_lua51-wsapi-xavante() {
  depends=('lua51' 'lua51-wsapi' 'lua51-xavante' 'luarocks5.1')

  _package_helper "5.1"
}

package_lua52-wsapi-xavante() {
  depends=('lua52' 'lua52-wsapi' 'lua52-xavante' 'luarocks5.2')

  _package_helper "5.2"
}

package_lua-wsapi-xavante() {
  depends=('lua' 'lua-wsapi' 'lua-xavante' 'luarocks')

  _package_helper "5.3"
}
