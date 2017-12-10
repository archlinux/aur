# Maintainer: Damien Flament <damien.flament at gmx dot com>

_pkgname=haskell-ide-engine
pkgname=${_pkgname}-git
pkgver=r1101.7017233
pkgrel=2
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
source=("git://github.com/haskell/${_pkgname}.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${srcdir}/${_pkgname}"
  
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  stack build
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  
  stack install --local-bin-path "${pkgdir}/usr/bin"
}
