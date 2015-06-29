# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=uacpid
pkgver=1.1
pkgrel=1
pkgdesc="Userspace Advanced Configuration and Power Interface event daemon"
arch=('i686' 'x86_64')
url="http://hub.darcs.net/dino/uacpid"
license=('custom:BSD3')
depends=('gmp' 'libffi')
makedepends=('ghc' 'cabal-install')
options=('strip')
source=("http://hackage.haskell.org/package/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")

md5sums=('b97df893764606fa361631a8b73bde0c')


# PKGBUILD functions

build() {
   cd ${srcdir}/${pkgname}-${pkgver}

   # This may have been causing problems in the past. It can possibly
   # be commented out.
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
