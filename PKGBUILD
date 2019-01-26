# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=lua-coxpcall
_rockname=coxpcall
pkgver=1.16.0
_tag=${pkgver//./_}
pkgrel=1
pkgdesc="Coxpcall encapsulates the protected calls with a coroutine based loop, so errors can be dealed without the usual pcall/xpcall issues with coroutines."
arch=('i686' 'x86_64')
url="http://keplerproject.github.io/coxpcall/"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("${_rockname}-${_tag}.tar.gz::https://github.com/keplerproject/${_rockname}/archive/v${_tag}.tar.gz")
md5sums=('1d25a2e5b0c0cd529b1fdc35dea2a06b')

build() {
  cd "$_rockname-$_tag"
  luarocks make --pack-binary-rock --deps-mode=none "rockspec/$_rockname-$pkgver-1.rockspec"
}

package() {
  luarocks install --tree="$pkgdir/usr/" --deps-mode=none "$_rockname-$_tag"/*.rock
  find "$pkgdir/usr" -name manifest -delete
}
