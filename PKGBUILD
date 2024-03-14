# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Nicola Squartini <tensor5@gmail.com>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=solidity
pkgver=0.8.25
pkgrel=1
pkgdesc='Contract-Oriented Programming Language'
arch=('x86_64')
url='https://github.com/ethereum/solidity'
license=('GPL3')
depends=('gcc-libs')
optdepends=('z3: SMT checker' 'cvc4: SMT checker')
makedepends=('boost' 'cmake')
source=("${pkgname}_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}.tar.gz")
sha512sums=('03d47be7f7356cf6e0763fa96a008076e2baec849064bea74135e8c59b50c7734c3757f9e748b410a2a9fc6c8d05a712ed8783f4457de9f3e6e8f32317b6f538')

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
