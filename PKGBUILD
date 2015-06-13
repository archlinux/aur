# Maintainer: 2ion <dev@2ion.de>
pkgname=lua-xonstat-git
pkgver=r2.d666462
pkgrel=1
pkgdesc="Lua client library for the stats.xonotic.org API"
arch=('any')
url="https://github.com/2ion/lua-xonstat"
license=('GPL3')
depends=('lua' 'lua-socket' 'lua-luajson')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/2ion/lua-xonstat.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local _lua_version=$(lua -e 'print(_VERSION:sub(-3,-1))')
  cd "$srcdir/${pkgname%-git}"
  install -m755 -d "${pkgdir}/usr/share/lua/${_lua_version}/xonotic"
  install -m755 -D lib/xonotic/stats "${pkgdir}/usr/share/lua/${_lua_version}/xonotic/stats.lua"
}
