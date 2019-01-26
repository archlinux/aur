# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=lua-luasocket-git
pkgver=646.288219f
pkgrel=2
pkgdesc="Network support for the Lua language"
arch=('i686' 'x86_64')
url="http://www.impa.br/~diego/software/luasocket"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
provides=('lua-luasocket')
conflicts=()
source=("$pkgname::git+https://github.com/diegonehab/luasocket.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/"$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$pkgname"
  luarocks make --pack-binary-rock --deps-mode=none luasocket-scm-0.rockspec
}

package() {
  luarocks install --tree="$pkgdir/usr/" --deps-mode=none "$pkgname"/*.rock
  find "$pkgdir/usr" -name manifest -delete
}
