# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Nicola Squartini <tensor5@gmail.com>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=solidity
pkgver=0.8.20
pkgrel=1
pkgdesc='Contract-Oriented Programming Language'
arch=('x86_64')
url='https://github.com/ethereum/solidity'
license=('GPL3')
optdepends=('z3: SMT checker' 'cvc4: SMT checker')
makedepends=('boost' 'cmake')
source=("${pkgname}_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}.tar.gz")
sha512sums=('5888269cf3e38288bd429c3e584966c2d69b313e31855802c2f6d5a7309f0303043afb30f2398661928f981977f90ca0a7fac4403a177cc8f3535a0c9336df30')

build() {
  cmake -B build -S "${pkgname}_${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DTESTS=OFF \
    -DSTRICT_Z3_VERSION=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
