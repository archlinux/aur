# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=('lua-coxpcall' 'lua51-coxpcall' 'lua52-coxpcall')
pkgbase=lua-coxpcall
_rockname=coxpcall
pkgver=1.16.0
_tag=${pkgver//./_}
pkgrel=1
pkgdesc="Coxpcall encapsulates the protected calls with a coroutine based loop, so errors can be dealed without the usual pcall/xpcall issues with coroutines."
arch=('i686' 'x86_64')
url="http://keplerproject.github.io/coxpcall/"
license=('MIT')
source=("${_rockname}-${_tag}.tar.gz::https://github.com/keplerproject/${_rockname}/archive/v${_tag}.tar.gz")
md5sums=('1d25a2e5b0c0cd529b1fdc35dea2a06b')

_package_helper() {
  _lua_ver=$1

  mkdir -p "$_lua_ver"
  cd "$_rockname-$_tag"
  luarocks-${_lua_ver} make --pack-binary-rock --deps-mode=none "rockspec/$_rockname-$pkgver-1.rockspec"
  mv *.rock ../${_lua_ver}/

  luarocks-${_lua_ver} install --tree="$pkgdir/usr/" --deps-mode=none ../${_lua_ver}/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package_lua51-coxpcall() {
  depends=('lua51' 'luarocks5.1')

  _package_helper "5.1"
}

package_lua52-coxpcall() {
  depends=('lua52' 'luarocks5.2')

  _package_helper "5.2"
}

package_lua-coxpcall() {
  depends=('lua' 'luarocks')

  _package_helper "5.3"
}
