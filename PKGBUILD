# Maintainer: Charles Heywood <charles@hashbang.sh>
pkgname=lua-fifo-git
pkgver=r38.3023e5f
pkgrel=1
pkgdesc="FIFO library for Lua"
arch=('i686' 'x86_64')
url="https://github.com/daurnimator/fifo.lua"
makedepends=('git')
source=('git+https://github.com/daurnimator/fifo.lua.git#branch=master')
md5sums=('SKIP')
_luaversions=('5.3')
pkgver() {
  cd "$srcdir/fifo.lua"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
package() {
  cd "$srcdir/fifo.lua"
  for version in ${_luaversions[@]}; do
    install -D -m644 fifo.lua "${pkgdir}/usr/share/lua/${version}/fifo.lua"
  done
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set et sts=0 sw=2 ts=2:
