# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgbase=lua-luasocket-git
pkgname=('lua-luasocket-git' 'lua51-luasocket-git' 'lua52-luasocket-git')
pkgver=646.288219f
pkgrel=1
pkgdesc="Network support for the Lua language"
arch=('i686' 'x86_64')
url="http://www.impa.br/~diego/software/luasocket"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("$pkgname::git+https://github.com/diegonehab/luasocket.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/"$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  mkdir -p 5.1 5.2 5.3

  cd "$pkgname"

  # Build for 5.1
  luarocks make --pack-binary-rock --lua-version=5.1 --deps-mode=none luasocket-scm-0.rockspec
  mv *.rock ../5.1/
  # Build for 5.2
  luarocks make --pack-binary-rock --lua-version=5.2 --deps-mode=none luasocket-scm-0.rockspec
  mv *.rock ../5.2/
  # Build for 5.3
  luarocks make --pack-binary-rock --lua-version=5.3 --deps-mode=none luasocket-scm-0.rockspec
  mv *.rock ../5.3/
}

package_lua51-luasocket-git() {
  pkgdesc='luasocket for Lua 5.1'

  luarocks install --lua-version=5.1 --tree="$pkgdir/usr/" --deps-mode=none 5.1/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package_lua52-luasocket-git() {
  pkgdesc='luasocket for Lua 5.2'

  luarocks install --lua-version=5.2 --tree="$pkgdir/usr/" --deps-mode=none 5.2/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package_lua-luasocket-git() {
  pkgdesc='luasocket for Lua 5.3'

  luarocks install --lua-version=5.3 --tree="$pkgdir/usr/" --deps-mode=none 5.3/*.rock
  find "$pkgdir/usr" -name manifest -delete
}
