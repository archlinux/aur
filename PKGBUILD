# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=sealcrypto
pkgver=3.3.2
pkgrel=1
pkgdesc='Microsoft library for fully homomorphic encryption'
arch=('x86_64')
url="https://sealcrypto.org/"
license=('MIT')
makedepends=('cmake')
source=("https://github.com/Microsoft/SEAL/archive/${pkgver}.tar.gz")
sha256sums=('33f4775d4e9767699f3b26b6ce31a1f799a42c06ef27ba467b0f4c34c0f7f66e')
provides=('sealcrypto')

build() {
  cd ${srcdir}
  tar xf ${pkgver}.tar.gz
  cd SEAL-${pkgver}/native/src
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr .
  make -j
}

package() {
  cd ${srcdir}/SEAL-${pkgver}
  install -m644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cd native/src
  make install
}
