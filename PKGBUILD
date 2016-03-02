# Maintainer: Charles Heywood <charles@hashbang.sh>
pkgname=lua-basexx-git
pkgver=v0.1.0.r26.g14faa9d
pkgrel=1
pkgdesc="Lua base2, base16, base32, base64, and base85 decoding and encoding."
arch=('i686' 'x86_64')
url="https://github.com/aiq/basexx"
license=('MIT')
makedepends=('git')
source=('git+https://github.com/aiq/basexx.git#branch=master')
md5sums=('SKIP')
_luaversions=('5.1' '5.2' '5.3')
pkgver() {
  cd "$srcdir/basexx"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
package() {
  cd "$srcdir/basexx"
  for version in ${_luaversions[@]}; do
    install -D -m44 lib/basexx.lua ${pkgdir}/usr/share/lua/${version}/basexx.lua
  done
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set et sts=0 sw=2 ts=2:
