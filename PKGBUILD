# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=('lua-socket-git' 'lua51-socket-git' 'lua52-socket-git')
pkgbase=lua-socket-git
pkgver=646.288219f
pkgrel=1
pkgdesc="Network support for the Lua language"
arch=('i686' 'x86_64')
url="http://www.impa.br/~diego/software/luasocket"
license=('MIT')
source=("$pkgbase::git+https://github.com/diegonehab/luasocket.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/"$pkgbase"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package_lua51-socket-git() {
  depends=('lua51' 'luarocks5.1')
  provides=('lua51-socket')

  mkdir -p 5.1
  cd "$pkgbase"
  luarocks-5.1 make --pack-binary-rock --deps-mode=none luasocket-scm-0.rockspec
  mv *.rock ../5.1/
  luarocks-5.1 install --tree="$pkgdir/usr/" --deps-mode=none ../5.1/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package_lua52-socket-git() {
  depends=('lua52' 'luarocks5.2')
  provides=('lua52-socket')

  mkdir -p 5.2
  cd "$pkgbase"
  luarocks-5.2 make --pack-binary-rock --deps-mode=none luasocket-scm-0.rockspec
  mv *.rock ../5.2/
  luarocks-5.2 install --tree="$pkgdir/usr/" --deps-mode=none ../5.2/*.rock
  find "$pkgdir/usr" -name manifest -delete
}

package_lua-socket-git() {
  depends=('lua' 'luarocks')
  provides=('lua-socket')

  mkdir -p 5.3
  cd "$pkgbase"
  luarocks-5.3 make --pack-binary-rock --deps-mode=none luasocket-scm-0.rockspec
  mv *.rock ../5.3/
  luarocks install --tree="$pkgdir/usr/" --deps-mode=none ../5.3/*.rock
  find "$pkgdir/usr" -name manifest -delete
}
