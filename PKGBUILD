# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=tetris-terminal-git
_pkgname=tetris
pkgver=r82.8f506c3
pkgrel=1
pkgdesc="Terminal interface for Tetris"
arch=('i686' 'x86_64')
url="https://github.com/samtay/tetris"
license=('custom')
makedepends=('stack')
source=("${_pkgname}"::'git+https://github.com/samtay/tetris')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
