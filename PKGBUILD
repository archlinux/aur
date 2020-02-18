# Maintainer: Sam Tay <samdotchongdottayatgmaildotcom>

pkgname=snake-terminal-git
_pkgname=snake
pkgver=r21.31af0e8
pkgrel=2
pkgdesc="Terminal interface for Snake"
arch=('i686' 'x86_64')
url="https://github.com/samtay/snake"
license=('custom')
makedepends=('stack')
source=("${_pkgname}"::'git+https://github.com/samtay/snake')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/${_pkgname}"
  stack build --ghc-build=tinfo6
}

package() {
  cd "$srcdir/${_pkgname}"
  stack install --ghc-build=tinfo6 --local-bin-path="${pkgdir}/usr/bin"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
