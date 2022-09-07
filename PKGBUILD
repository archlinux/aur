# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=(lua51-luaproc lua52-luaproc lua53-luaproc)
pkgbase=lua-luaproc
_rockname=luaproc
pkgver=1.0
pkgrel=4
pkgdesc="Concurrency programming library for Lua"
arch=('i686' 'x86_64')
url="https://github.com/askyrme/luaproc"
license=('MIT')
source=(
    "${_rockname}-${pkgver}.tar.gz::https://github.com/askyrme/${_rockname}/archive/${pkgver}-${pkgrel}.tar.gz"
    "https://luarocks.org/manifests/askyrme/luaproc-1.0-4.rockspec"
)
md5sums=(
    'c80b27a812b2b73faa07411fa8155a5f'
    '140945b4b7d8ae8ff2151de84fe94c90'
)
makedepends=(
    lua51
    lua52
    lua53
    luarocks
)

_package_helper() {
  _lua_ver=$1

  mkdir -p "$_lua_ver"
  cd "$_rockname-$pkgver-$pkgrel"
  luarocks make --pack-binary-rock --deps-mode=none "..//$_rockname-$pkgver-$pkgrel.rockspec"
  mv *.rock ../${_lua_ver}/
  luarocks install --tree="$pkgdir/usr/" --deps-mode=none ../${_lua_ver}/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package_lua51-luaproc() {
  _package_helper '5.1'
}

package_lua52-luaproc() {
  _package_helper '5.2'
}

package_lua53-luaproc() {
  _package_helper '5.3'
}
