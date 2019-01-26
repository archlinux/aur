# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=lua-rings
_rockname=rings
pkgver=1.3.0
_tag=${pkgver//./_}
pkgrel=1
pkgdesc="Rings is a library which provides a way to create new Lua states from within Lua."
arch=('i686' 'x86_64')
url="http://keplerproject.github.com/rings"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/keplerproject/${_rockname}/archive/v_${_tag}.tar.gz")
md5sums=('f4182f03934d40cbb40d80922febc1b1')

build() {
  cd "$_rockname-v_$_tag"
  luarocks make --pack-binary-rock --deps-mode=none "rockspecs/$_rockname-$pkgver-1.rockspec"
}

package() {
  luarocks install --tree="$pkgdir/usr/" --deps-mode=none "$_rockname-v_$_tag"/*.rock
  find "$pkgdir/usr" -name manifest -delete
}
