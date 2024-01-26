# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Nicola Squartini <tensor5@gmail.com>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=solidity
pkgver=0.8.24
pkgrel=1
pkgdesc='Contract-Oriented Programming Language'
arch=('x86_64')
url='https://github.com/ethereum/solidity'
license=('GPL3')
depends=('gcc-libs')
optdepends=('z3: SMT checker' 'cvc4: SMT checker')
makedepends=('boost' 'cmake')
source=("${pkgname}_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}.tar.gz")
sha512sums=('24c3eb63b8c6ab8cae22fe26d7ce58002c34fa4e7371841833ba87363af2706826f5f86a0ef6945d7073fe52458e6f55f31b86af3469a6b039854aca36ebb869')

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
