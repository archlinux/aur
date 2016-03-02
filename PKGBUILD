# Maintainer: Charles Heywood <charles@hashbang.sh>
pkgname=lua-http-git
pkgver=r376.d59a831
pkgrel=1
pkgdesc="HTTP Library for Lua: Supports HTTP 1.0, 1.1, and 1.2; client and server."
arch=('i686' 'x86_64')
url="https://github.com/daurnimator/lua-http"
license=('MIT')
depends=('lua-cqueues-git' 'lua-lpeg' 'lua-lpeg-patterns-git' \
  'lua-basexx-git' 'lua-ossl-git' 'lua-fifo-git')
makedepends=('git')
source=('git+https://github.com/daurnimator/lua-http.git#branch=master')
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/lua-http"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
package() {
  cd "$srcdir/lua-http"
  for file in $(find http -type f -name '*.lua'); do
    install -D -m644 $file "${pkgdir}/usr/share/lua/5.3/$file"
  done
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
# vim:set et sts=0 sw=2 ts=2:
