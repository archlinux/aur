# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=lua-cgilua-git
_rockname=cgilua
pkgver=527.cd1a504
pkgrel=1
pkgdesc="CGILua is a tool for creating dynamic HTML pages and manipulating input data from Web forms."
arch=('i686' 'x86_64')
url="http://keplerproject.github.com/cgilua"
license=('MIT')
depends=('lua' 'lua-luafilesystem')
makedepends=('luarocks')
conflicts=()
source=("$pkgname::git+https://github.com/keplerproject/cgilua.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/"$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$pkgname"
  luarocks make --pack-binary-rock --deps-mode=none rockspec/${_rockname}-6.0.0-0.rockspec # The CVS rockspecs seem broken
}

package() {
  luarocks install --tree="$pkgdir/usr/" --deps-mode=none "$pkgname"/*.rock
  find "$pkgdir/usr" -name manifest -delete
}
