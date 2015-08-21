# Maintainer: Jiehong Ma <email@majiehong.com>

pkgname=ihaskell-sandbox-git
pkgver=c7196b1029
pkgrel=1
pkgdesc="A Haskell kernel for IPython."
arch=('i686' 'x86_64')
url="https://github.com/gibiansky/IHaskell"
license=('MIT')
depends=('ipython<3.3' 'python-pyzmq')
makedepends=('git' 'ghc' 'happy' 'gtk2hs-buildtools' 'cabal-install')
provides=('ihaskell')
conflicts=()
source=("git+https://github.com/gibiansky/IHaskell")
sha512sums=('SKIP')

prepare()
{
  cd "$srcdir/IHaskell"
  cabal sandbox init
  cabal update
}

build() {
  cd "$srcdir/IHaskell"
  cabal sandbox add-source ghc-parser ipython-kernel
  cabal install cpphs
  cabal install ghc-parser
  cabal install ipython-kernel
  cabal install .
}

package() {
  cd "$srcdir/IHaskell"
  cabal exec ihaskell install
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/IHaskell/.cabal-sandbox/bin/ihaskell" "$pkgdir/usr/bin/ihaskell"
  printf '%s\n' 'Enjoy haskell in your `ipython notebook`!'
}
