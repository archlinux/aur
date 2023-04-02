# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Nicola Squartini <tensor5@gmail.com>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=solidity
pkgver=0.8.19
pkgrel=1
pkgdesc='Contract-Oriented Programming Language'
arch=('x86_64')
url='https://github.com/ethereum/solidity'
license=('GPL3')
optdepends=('z3: SMT checker' 'cvc4: SMT checker')
makedepends=('boost' 'cmake')
source=("${pkgname}_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}.tar.gz")
sha512sums=('bb4b9e69770e51b0559346670a840d8b5961be64aa128380607f754c193d8258c18b16adf90f6a5273ed482b28bbcd7f29d1f9bda1f5feb6b1225dd99d630855')

build() {
  cmake -B build -S ${pkgname}_${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DTESTS=OFF \
    -DSTRICT_Z3_VERSION=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
