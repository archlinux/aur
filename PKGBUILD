# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=lua51-sha2
_rockname=sha2
pkgver=0.2.0
pkgrel=1
pkgdesc="Lua binding for Aaron Gifford's SHA-2 implementation"
arch=('i686' 'x86_64')
url="http://code.google.com/p/sha2/"
license=('MIT')
source=("https://github.com/lgierth/lua-sha2/raw/master/sha2-0.2.0.zip"
        "https://luarocks.org/manifests/luarocks/sha2-0.2.0-1.rockspec")
md5sums=('ee59eef03995fb93ed3a5e4acbd1883c'
         '3e42c54857a73d3e91999114bd3963cd')

_package_helper() {
  _lua_ver=$1

  mkdir -p "$_lua_ver"
  cd "$_rockname-${pkgver}"
  luarocks-${_lua_ver} make --pack-binary-rock --deps-mode=none "../$_rockname-$pkgver-1.rockspec"
  mv *.rock ../${_lua_ver}/

  luarocks-${_lua_ver} install --tree="$pkgdir/usr/" --deps-mode=none ../${_lua_ver}/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package() {
  depends=('lua51' 'luarocks5.1')

  _package_helper "5.1"
}
