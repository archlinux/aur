# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=('lua-rings' 'lua51-rings' 'lua52-rings')
pkgbase=lua-rings
_rockname=rings
pkgver=1.3.0
_tag=${pkgver//./_}
pkgrel=1
pkgdesc="Rings is a library which provides a way to create new Lua states from within Lua."
arch=('i686' 'x86_64')
url="http://keplerproject.github.com/rings"
license=('MIT')
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/keplerproject/${_rockname}/archive/v_${_tag}.tar.gz")
md5sums=('f4182f03934d40cbb40d80922febc1b1')

_package_helper() {
  _lua_ver=$1

  mkdir -p "$_lua_ver"
  cd "$_rockname-v_$_tag"
  luarocks-${_lua_ver} make --pack-binary-rock --deps-mode=none "rockspecs/$_rockname-$pkgver-1.rockspec"
  mv *.rock ../${_lua_ver}/
  luarocks-${_lua_ver} install --tree="$pkgdir/usr/" --deps-mode=none ../${_lua_ver}/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package_lua51-rings() {
  depends=('lua51' 'luarocks5.1')

  _package_helper "5.1"
}

package_lua52-rings() {
  depends=('lua52' 'luarocks5.2')

  _package_helper "5.2"
}

package_lua-rings() {
  depends=('lua' 'luarocks')

  _package_helper "5.3"
}
