# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=lua-jsonrpc4lua
_rockname=jsonrpc4lua
pkgver=1.0.1
pkgrel=1
pkgdesc="A very basic JSON RPC client and server-side module. This repository is a fork of the original craigmj/json4lua repository with bug fixes and the switch to lua-cjson for JSON encoding and decoding."
arch=('i686' 'x86_64')
url="https://github.com/pdxmeshnet/jsonrpc4lua"
license=('GPL')
depends=('lua' 'lua-luasocket' 'lua-cgilua-git' 'lua-cjson')
optdepends=('lua-xavante: Optional requirement to run the server-side example')
makedepends=('luarocks')
conflicts=()
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/pdxmeshnet/${_rockname}/archive/${pkgver}.tar.gz")
md5sums=('7b885a8d07bbcc84f7380cd1e9e32016')

build() {
  cd "$_rockname-$pkgver"
  luarocks make --pack-binary-rock --deps-mode=none "$_rockname-$pkgver-1.rockspec"
}

package() {
  luarocks install --tree="$pkgdir/usr/" --deps-mode=none "$_rockname-$pkgver"/*.rock
  find "$pkgdir/usr" -name manifest -delete
}
