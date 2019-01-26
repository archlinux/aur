# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=lua-xavante
_rockname=xavante
pkgver=2.4.0
pkgrel=1
pkgdesc="Xavante is a Lua HTTP 1.1 Web server that uses a modular architecture based on URI mapped handlers."
arch=('i686' 'x86_64')
url="http://keplerproject.github.com/xavante"
license=('MIT')
depends=('lua' 'lua-luasocket' 'lua-copas' 'lua-luafilesystem')
makedepends=('luarocks')
conflicts=()
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/keplerproject/${_rockname}/archive/v${pkgver}.tar.gz")
md5sums=('73948f18ac884371da1ad2b17ebf2b70')

build() {
  cd "$_rockname-$pkgver"
  luarocks make --pack-binary-rock --deps-mode=none "rockspec/$_rockname-$pkgver-1.rockspec"
}

package() {
  luarocks install --tree="$pkgdir/usr/" --deps-mode=none "$_rockname-$pkgver"/*.rock
  find "$pkgdir/usr" -name manifest -delete
}
