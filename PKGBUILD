# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=('lua51-dkjson' 'lua52-dkjson')
pkgbase=lua51-dkjson
_rockname=dkjson
pkgver=2.5
pkgrel=1
pkgdesc="David Kolf's JSON module for Lua"
arch=('i686' 'x86_64')
url="http://dkolf.de/src/dkjson-lua.fsl/"
license=('MIT')
source=("${_rockname}-${pkgver}.tar.gz::http://dkolf.de/src/dkjson-lua.fsl/tarball/dkjson-2.5.tar.gz?uuid=release_2_5")
md5sums=('6f0b6f16314472366e383188386a172b')

_package_helper() {
  _lua_ver=$1

  mkdir -p "$_lua_ver"
  cd "$_rockname-$pkgver"
  luarocks-${_lua_ver} make --pack-binary-rock --deps-mode=none "$_rockname-$pkgver-1.rockspec"
  mv *.rock ../${_lua_ver}/
  luarocks-${_lua_ver} install --tree="$pkgdir/usr/" --deps-mode=none ../${_lua_ver}/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package_lua51-dkjson() {
  depends=('lua51' 'luarocks5.1')

  _package_helper "5.1"
}

package_lua52-dkjson() {
  depends=('lua52' 'luarocks5.2')

  _package_helper "5.2"
}
