# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=('lua-copas' 'lua51-copas' 'lua52-copas')
pkgbase=lua-copas
_rockname=copas
pkgver=2.0.2
pkgrel=1
pkgdesc="Copas is a dispatcher based on coroutines that can be used by TCP/IP servers."
arch=('i686' 'x86_64')
url="http://keplerproject.github.io/copas"
license=('MIT')
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/keplerproject/${_rockname}/archive/${pkgver}.tar.gz")
md5sums=('dfb5969f077b4bf9a222a3c532400b45')

_package_helper() {
  _lua_ver=$1

  mkdir -p "$_lua_ver"
  cd "$_rockname-$pkgver"
  luarocks-${_lua_ver} make --pack-binary-rock --deps-mode=none "rockspec/$_rockname-$pkgver-1.rockspec"
  mv *.rock ../${_lua_ver}/

  luarocks-${_lua_ver} install --tree="$pkgdir/usr/" --deps-mode=none ../${_lua_ver}/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package_lua51-copas() {
  depends=('lua51' 'lua51-socket' 'lua51-coxpcall' 'luarocks5.1')

  _package_helper "5.1"
}

package_lua52-copas() {
  depends=('lua52' 'lua52-socket' 'lua52-coxpcall' 'luarocks5.2')

  _package_helper "5.2"
}

package_lua-copas() {
  depends=('lua' 'lua-socket' 'lua-coxpcall' 'luarocks')

  _package_helper "5.3"
}
