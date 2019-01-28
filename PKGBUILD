# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=('lua-bencode' 'lua51-bencode' 'lua52-bencode')
pkgbase=lua-bencode
_rockname=bencode
pkgver=2.2.0
pkgrel=1
pkgdesc="Library for encoding and decoding bencoded data"
arch=('i686' 'x86_64')
url="https://bitbucket.org/wilhelmy/lua-bencode/"
license=('MIT')
source=("https://bitbucket.org/wilhelmy/${pkgbase}/downloads/${pkgbase}-${pkgver}.tar.gz"
        "https://luarocks.org/manifests/mw/bencode-2.2.0-1.rockspec")
md5sums=('f4a7d5c6cbbdf1ceecaf3d5e03b79f39'
         '54c11bc08720a212658bb3253659ee6d')

_package_helper() {
  _lua_ver=$1

  mkdir -p "$_lua_ver"
  cd "$pkgbase-$pkgver"
  luarocks-${_lua_ver} make --pack-binary-rock --deps-mode=none "../$_rockname-$pkgver-1.rockspec"
  mv *.rock ../${_lua_ver}/
  luarocks-${_lua_ver} install --tree="$pkgdir/usr/" --deps-mode=none ../${_lua_ver}/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package_lua51-bencode() {
  depends=('lua51' 'luarocks5.1')

  _package_helper "5.1"
}

package_lua52-bencode() {
  depends=('lua52' 'luarocks5.2')

  _package_helper "5.2"
}

package_lua-bencode() {
  depends=('lua' 'luarocks')

  _package_helper "5.3"
}
