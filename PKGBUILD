_lua_version=5.4
_lua_name=lux-lua

pkgname=(lua-${_lua_name} lua53-${_lua_name} lua52-${_lua_name} lua51-${_lua_name})
pkgver=0.8.2
pkgrel=1
pkgdesc="An embeddable Lua command prompt as well as a stand-alone interpreter with pretty-printing and autocompletion."
arch=(i686 x86_64)
url="https://github.com/nvim-neorocks/lux"
license=('MIT')
makedepends=(lua lua53 lua52 lua51 rust)
source=("${pkgname}-${pkgver}::https://github.com/nvim-neorocks/lux/archive/v${pkgver}.tar.gz")
md5sums=('a0250d107888d9ea7d72d065ccb67f5a')

_package() {
  cp -a "$srcdir/lux-$pkgver" "$srcdir/$_lua_name-$pkgver-$1"
  cd "$srcdir/$_lua_name-$pkgver-$1"

  cargo xtask-lua${1/\./} dist
  install -Dm644 "target/dist/$1"/* -t "$pkgdir/usr/lib/lua/$1"
  install -Dm644 target/dist/lib/pkgconfig/* -t "$pkgdir/usr/lib/pkgconfig/$1"
}

package_lua51-lux-lua() {
  _package 5.1
}

package_lua52-lux-lua() {
  _package 5.2
}

package_lua53-lux-lua() {
  _package 5.3
}

package_lua-lux-lua() {
  _package $_lua_version
}
# vim:set ts=2 sw=2 et:
