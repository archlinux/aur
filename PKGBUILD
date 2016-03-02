# Maintainer: Charles Heywood <charles@hashbang.sh>
pkgname=lua-lpeg-patterns-git
pkgver=r51.625e2da
pkgrel=1
pkgdesc="A collection of useful LPEG patterns"
arch=('i686' 'x86_64')
url="https://github.com/daurnimator/lpeg_patterns"
depends=('lua-lpeg')
makedepends=('git')
source=('git+https://github.com/daurnimator/lpeg_patterns.git#branch=master')
md5sums=('SKIP')
_luaversions=('5.3')
pkgver() {
  cd "$srcdir/lpeg_patterns"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
package() {
  cd "$srcdir/lpeg_patterns"
  for version in ${_luaversions[@]}; do
    for file in $(find . -type f -name '*.lua'); do
      install -D -m644 $file "${pkgdir}/usr/share/lua/${version}/$file"
    done
  done
  # No license
}
# vim:set et sts=0 sw=2 ts=2:
