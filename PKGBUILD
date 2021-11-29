# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=haskell-jet-git
pkgver=r55.4dc00e9
pkgrel=2
pkgdesc="A structural editor for JSON values"
arch=('x86_64')
url="https://github.com/ChrisPenner/jet"
license=('BSD-3-Clause')
source=("git+https://github.com/ChrisPenner/jet.git")
sha256sums=('SKIP')
depends=('cabal-install' 'ghc')

pkgver() {
  cd jet
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/jet
  cabal update
  cabal build
}

package() {
  GHCVER=$(ghc --version | sed -n 's/^.*version \([0-9.]*\)/\1/p')
  install -Dm 755 "$srcdir/jet/dist-newstyle/build/x86_64-linux/ghc-$GHCVER/jet-0.0.0.1/x/jet/build/jet/jet" "$pkgdir/usr/bin/jet"
}
