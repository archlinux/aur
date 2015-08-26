# Maintainer: Jiehong Ma <email@majiehong.com>

pkgname=ihaskell-git
pkgver=0.7.0
pkgrel=1
pkgdesc="A Haskell kernel for IPython, built in a sandbox."
arch=('i686' 'x86_64')
url="https://github.com/gibiansky/IHaskell"
license=('MIT')
depends=('ipython>=4' 'python-pyzmq' 'jupyter')
makedepends=('git' 'ghc<7.11' 'happy' 'gtk2hs-buildtools' 'haskell-stack')
provides=('ihaskell')
conflicts=()
source=("git+https://github.com/gibiansky/IHaskell" 'stack.patch')
sha512sums=('SKIP'
            '04f6797a49deda3300fb058501a5cc500549f1e436d91e4cd8416ff4bbbf4f1033984cd9ca5304fddbd5aca7a3bf4bc66473fbad5f7f55187359ecd0d9353f8c')

prepare()
{
  cd "$srcdir/IHaskell"
  patch stack.yaml ../../stack.patch
}

build() {
  cd "$srcdir/IHaskell"
  stack install ghc-parser --no-copy-bins
  stack install ipython-kernel --no-copy-bins
  stack install system-argv0 --no-copy-bins
  stack install ihaskell --no-copy-bins
}

package() {
  cd "$srcdir/IHaskell/.stack-work/install/x86_64-linux/nightly-2015-08-03/7.10.1/bin"
  mkdir -p "$pkgdir/usr/bin/"
  cp ihaskell "$pkgdir/usr/bin/ihaskell"
  printf '\n%s\n' "Now, install ihaskell with `ihaskell install`, and enjoy it in ipython notebook or console!"
  printf '%s\n' 'Also make sure to set resolver to `resolver: nightly-2015-08-03` in your ~/.stack/global/stack.yaml file.'
}
