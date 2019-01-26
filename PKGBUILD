# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=lua-copas
_rockname=copas
pkgver=2.0.2
pkgrel=1
pkgdesc="Copas is a dispatcher based on coroutines that can be used by TCP/IP servers."
arch=('i686' 'x86_64')
url="http://keplerproject.github.io/copas"
license=('MIT')
depends=('lua' 'lua-luasocket' 'lua-coxpcall')
makedepends=('luarocks')
conflicts=()
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/keplerproject/${_rockname}/archive/${pkgver}.tar.gz")
md5sums=('dfb5969f077b4bf9a222a3c532400b45')

build() {
  cd "$_rockname-$pkgver"
  luarocks make --pack-binary-rock --deps-mode=none "rockspec/$_rockname-$pkgver-1.rockspec"
}

package() {
  luarocks install --tree="$pkgdir/usr/" --deps-mode=none "$_rockname-$pkgver"/*.rock
  find "$pkgdir/usr" -name manifest -delete
}
