# Maintainer : Damien Flament <damien.flament___at___gmx___dot___com>:w
# Contributor: Daniel Nagy <danielnagy___at___gmx___dot___de>

# custom variables
_hkgname=cabal2arch
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=cabal2arch
pkgver=1.2
pkgrel=3
pkgdesc="Create Arch Linux packages from Cabal packages."
url="http://github.com/archhaskell/"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=("ghc" "haskell-archlinux" "haskell-cmdargs" "haskell-mtl")
depends=()
options=('strip' 'staticlibs' )
source=("https://github.com/archhaskell/cabal2arch/archive/v1.2.tar.gz"
        'Make_build_pass.patch')

md5sums=('68f08d55400a31927e63942f0ca5e462'
         'b22ef0e1bcc21f81b4dbd34e9599d441')

# PKGBUILD functions
prepare() {
  cd ${_hkgname}-${pkgver}

  patch -Np1 -i "${srcdir}/Make_build_pass.patch"
}

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O --prefix=/usr --docdir=/usr/share/doc/${pkgname}
    runhaskell Setup build
}

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
}
