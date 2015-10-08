# Maintainer: Jiehong Ma <email@majiehong.com>

pkgname=ihaskell-git
pkgver=0.7.1
pkgrel=3
pkgdesc="A Haskell kernel for IPython, built in a sandbox."
arch=('i686' 'x86_64')
url="https://github.com/gibiansky/IHaskell"
license=('MIT')
depends=('ipython>=4' 'python-pyzmq' 'jupyter' 'ghc=7.10.2')
makedepends=('git' 'happy' 'gtk2hs-buildtools' 'haskell-stack')
provides=('ihaskell')
conflicts=()
source=("git+https://github.com/gibiansky/IHaskell")
sha512sums=('SKIP')

prepare()
{
  cd "$srcdir/IHaskell"
}

build() {
  cd "$srcdir/IHaskell"
  git checkout "v${pkgver}.0"
  stack setup
  printf '%s\n' 'If you never used stack before, run `stack init` first.'
  stack install ghc-parser --no-copy-bins
  stack install ipython-kernel --no-copy-bins
  stack install system-argv0 --no-copy-bins
  stack install ihaskell --no-copy-bins
}

package() {
  cd "$srcdir/IHaskell/.stack-work/install/x86_64-linux/nightly-2015-08-15/7.10.2/bin"
  mkdir -p "$pkgdir/usr/bin/"
  cp ihaskell "$pkgdir/usr/bin/ihaskell"
  printf '\n%s\n' 'Now, install ihaskell with `ihaskell install`, and enjoy it in ipython notebook or console!'
  printf '%s\n\n' 'Also make sure to set resolver to `resolver: nightly-2015-08-15` in your ~/.stack/global/stack.yaml file.'
  printf '%s\n' 'If you run in any issue, make sure to check that you initialiazed stack with `stack init`' 'But change the resolver as mentionned'
}
