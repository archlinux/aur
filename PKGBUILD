# Maintainer: Damien Flament <damien.flament at gmx dot com>

pkgname=haskell-ide-engine
pkgver=0.1.0.0
pkgrel=1
pkgdesc="The engine for haskell ide-integration. Not an IDE."
arch=('i686' 'x86_64')
url="https://github.com/haskell/haskell-ide-engine"
license=('custom:BSD3')
depends=()
makedepends=('git' 'stack')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git://github.com/haskell/${pkgname}.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

_STACK_FLAGS="--system-ghc --jobs $(nproc)"
_STACK="stack $_STACK_FLAGS"

prepare() {
  cd "${srcdir}/${pkgname}"

  $_STACK build --dry-run
}

build() {
  cd "${srcdir}/${pkgname}"

  $_STACK build
}

package() {
  cd "${srcdir}/${pkgname}"

  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  $_STACK install --local-bin-path "${pkgdir}/usr/bin"
}
