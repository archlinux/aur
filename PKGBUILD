# Maintainer: Damien Flament <damien.flament at gmx dot com>
# Maintainer: Reed Mullanix <reedmullanix at gmail dot com>

_pkgname=haskell-ide-engine
pkgname=${_pkgname}-git
pkgver=r1757.59d5d30
pkgrel=1
pkgdesc="The engine for Haskell ide-integration. Not an IDE."
arch=('i686' 'x86_64')
url="https://github.com/haskell/haskell-ide-engine"
license=('custom:BSD3')
depends=()
makedepends=('git' 'stack' 'cabal-install' 'happy')
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

  git submodule update --init

	stack --stack-yaml=stack-8.2.1.yaml build
	stack --stack-yaml=stack-8.2.2.yaml build
	stack --stack-yaml=stack-8.4.2.yaml build
	stack --stack-yaml=stack-8.4.3.yaml build
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	stack --stack-yaml=stack-8.2.1.yaml --local-bin-path "${pkgdir}/usr/bin/" install \
    && mv "${pkgdir}/usr/bin/hie" "${pkgdir}/usr/bin/hie-8.2.1"
	stack --stack-yaml=stack-8.2.2.yaml --local-bin-path "${pkgdir}/usr/bin/" install \
    && mv "${pkgdir}/usr/bin/hie" "${pkgdir}/usr/bin/hie-8.2.2" 
	stack --stack-yaml=stack-8.4.2.yaml --local-bin-path "${pkgdir}/usr/bin/" install \
    && mv "${pkgdir}/usr/bin/hie" "${pkgdir}/usr/bin/hie-8.4.2"
	stack --stack-yaml=stack-8.4.3.yaml --local-bin-path "${pkgdir}/usr/bin/" install \
    && cp "${pkgdir}/usr/bin/hie" "${pkgdir}/usr/bin/hie-8.4.3"
}


