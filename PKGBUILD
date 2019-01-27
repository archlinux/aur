# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=('lua-xavante' 'lua51-xavante' 'lua52-xavante')
pkgbase=lua-xavante
_rockname=xavante
pkgver=2.4.0
pkgrel=1
pkgdesc="Xavante is a Lua HTTP 1.1 Web server that uses a modular architecture based on URI mapped handlers."
arch=('i686' 'x86_64')
url="http://keplerproject.github.com/xavante"
license=('MIT')
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/keplerproject/${_rockname}/archive/v${pkgver}.tar.gz")
md5sums=('73948f18ac884371da1ad2b17ebf2b70')

_package_helper() {
  _lua_ver=$1

  mkdir -p "$_lua_ver"
  cd "$_rockname-$pkgver"
  luarocks-${_lua_ver} make --pack-binary-rock --deps-mode=none "rockspec/$_rockname-$pkgver-1.rockspec"
  mv *.rock ../${_lua_ver}/

  luarocks-${_lua_ver} install --tree="$pkgdir/usr/" --deps-mode=none ../${_lua_ver}/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package_lua51-xavante() {
  depends=('lua51' 'lua51-socket' 'lua51-copas' 'lua51-filesystem' 'luarocks5.1')

  _package_helper "5.1"
}

package_lua52-xavante() {
  depends=('lua52' 'lua52-socket' 'lua52-copas' 'lua52-filesystem' 'luarocks5.2')

  _package_helper "5.2"
}

package_lua-xavante() {
  depends=('lua' 'lua-socket' 'lua-copas' 'lua-filesystem' 'luarocks')

  _package_helper "5.3"
}
