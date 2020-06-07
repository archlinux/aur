# Maintainer: Olivia Mackintosh <livvy@base.nu>
_name="matrix-bot-haskell"
pkgname=matrix-bot-haskell-git
pkgver=0.0.1.0.r4.gb2b3812
pkgrel=1
pkgdesc="A [matrix] bot written in Haskell"
arch=('x86_64')
url="https://github.com/livmackintosh/matrix-bot-haskell"
license=('AGPL3')
depends=('libolm-git')
makedepends=('ghc' 'stack')
optdepends=('bash-completion: for bash completions')
source=("git+https://github.com/livmackintosh/${_name}")
provides=('matrix-bot')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_name}"
  stack clean ${_name}
  stack build --system-ghc --ghc-options -lolm ${_name}
}

package() {
  cd "${_name}"
  stack install --local-bin-path="$pkgdir/usr/bin" ${_name}
}
