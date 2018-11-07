# Maintainer: Flaviu Tamas <aur@flaviutamas.com>
pkgname=bnfc
pkgver=2.8.2
pkgrel=1
pkgdesc="The BNF Converter is a compiler construction tool generating a compiler front-end from a Labelled BNF grammar. It is currently able to generate C, C++, C#, Haskell, Java, and OCaml, as well as XML representations."
url="http://bnfc.digitalgrammars.com/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('gmp')
makedepends=('ghc' 'cabal-install' 'haskell-haddock-library' 'happy' 'alex' 'haskell-mtl')
optdepends=(
  'ghc: haskell output'
  'happy: haskell output'
  'alex: haskell output'
)
source=("https://github.com/BNFC/bnfc/archive/v${pkgver}.tar.gz")

sha256sums=('126753d8a33e03a9bbd1f258741bc9e35173615c71c84acb75c376405aecfa05')

build() {
  cd "${pkgname}-${pkgver}/source"

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --ghc-option='-dynload=deploy' --prefix=/usr --datasubdir="$pkgname"
  runhaskell Setup build
}

package() {
  cd "${pkgname}-${pkgver}/source"

  runhaskell Setup copy --destdir="${pkgdir}"
  rm -r "$pkgdir/usr/share/doc"
}

# vim:set ts=2 sw=2 et:
