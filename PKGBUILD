# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=photoname
pkgver=3.1
pkgrel=1
pkgdesc='Rename JPEG photo files based on shoot date'
arch=('i686' 'x86_64')
url="http://hub.darcs.net/dino/photoname"
license=('BSD3')
depends=('gmp' 'libexif' 'libffi')
makedepends=('ghc' 'cabal-install')
options=('strip')
source=("http://hackage.haskell.org/package/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('37935445c01a19e9a6505b7d660ddf01543af14ddc26eb5d2689fb4bdd778434')


# PKGBUILD functions

build() {
   cd ${srcdir}/${pkgname}-${pkgver}

   # You can comment this out but it's a good idea to keep your
   # cabal updated.
   cabal update

   cabal sandbox init
   cabal install --only-dependencies
   cabal configure -O --prefix=/usr
   cabal build
}

package() {
   cd ${srcdir}/${pkgname}-${pkgver}

   cabal copy --destdir=${pkgdir}
}
