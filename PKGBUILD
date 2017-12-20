# Maintainer: Alexander Schmidt <zyeryi@gmail.com>

_pkgname=erd
pkgname=erd-git
pkgver=r59.06a5ba5
pkgrel=1
pkgdesc='erd is a utility for generating entity-relationship diagrams from plain-text descriptions'
arch=('i686' 'x86_64')
url='https://github.com/BurntSushi/erd'
license=('CUSTOM')
depends=('haskell-graphviz' 'haskell-parsec')
makedepends=('ghc' 'cabal-install>=1.8')
provides=('erd')
source=("${_pkgname}::git+https://github.com/BurntSushi/${_pkgname}.git")
md5sums=('SKIP')


pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"

    cabal configure --prefix='/usr' --docdir='$prefix/share/doc/erd-git'
    cabal haddock --hyperlink-source --executables
    cabal build
}

package() {
    cd "${_pkgname}"

    cabal copy --destdir="${pkgdir}/"
    install -Dm644 UNLICENSE ${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE
}
