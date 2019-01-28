# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=('lua-inifile' 'lua51-inifile' 'lua52-inifile')
pkgbase=lua-inifile
_rockname=inifile
pkgver=1.0
pkgrel=1
pkgdesc="Inifile is a simple, complete ini parser for lua"
arch=('i686' 'x86_64')
url="http://docs.bartbes.com/inifile"
license=('BSD')
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/bartbes/inifile/archive/v${pkgver}.tar.gz")
md5sums=('33e5b3e8eb9f4e2430cfb548e6f6d6fe')

_package_helper() {
  _lua_ver=$1

  mkdir -p "$_lua_ver"
  cd "$_rockname-$pkgver"
  luarocks-${_lua_ver} make --pack-binary-rock --deps-mode=none "$_rockname-$pkgver-2.rockspec"
  mv *.rock ../${_lua_ver}/

  luarocks-${_lua_ver} install --tree="$pkgdir/usr/" --deps-mode=none ../${_lua_ver}/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package_lua51-inifile() {
  depends=('lua51' 'luarocks5.1')

  _package_helper "5.1"
}

package_lua52-inifile() {
  depends=('lua52' 'luarocks5.2')

  _package_helper "5.2"
}

package_lua-inifile() {
  depends=('lua' 'luarocks')

  _package_helper "5.3"
}
