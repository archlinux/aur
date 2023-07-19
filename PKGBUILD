# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Nicola Squartini <tensor5@gmail.com>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=solidity
pkgver=0.8.21
pkgrel=1
pkgdesc='Contract-Oriented Programming Language'
arch=('x86_64')
url='https://github.com/ethereum/solidity'
license=('GPL3')
optdepends=('z3: SMT checker' 'cvc4: SMT checker')
makedepends=('boost' 'cmake')
source=("${pkgname}_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}.tar.gz")
sha512sums=('c39ace715b9cfef83d89c94dc01c819cd87782ed23293c8f8a6970854b285715177d39889e85e4e0105774038abc317130de6e11591a4a95ed2d0402ea8bd718')

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
