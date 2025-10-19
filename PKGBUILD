# Maintainer: Valerii Huz <ghotrix at gmail dot com>

pkgname=stockfish-git
pkgver=r6822.g75edbee01
pkgrel=1
pkgdesc="A free UCI chess engine derived from Glaurung 2.1 (git version)"
arch=('i686' 'x86_64')
url="http://stockfishchess.org/"
license=('GPL3')
optdepends=('polyglot-winboard-git: for xboard support')
makedepends=('git')
provides=('stockfish')
conflicts=('stockfish')
install=stockfish.install
source=("$pkgname::git+https://github.com/official-stockfish/Stockfish.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname/src"

  if [[ "$CC" = "gcc" ]]
  then
    _COMP=gcc
  elif [[ "$CC" = "clang" ]]
  then
    _COMP=clang
  else
    _COMP=
  fi

  COMP=${_COMP} make profile-build
}

package() {
  cd "$pkgname/src"
  make PREFIX="$pkgdir/usr" install
}

# vim:set sts=2 sw=2 et:
