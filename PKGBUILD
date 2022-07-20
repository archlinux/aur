# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=sealcrypto
pkgver=4.0.0
pkgrel=1
pkgdesc='Microsoft library for fully homomorphic encryption'
arch=('x86_64')
url="https://sealcrypto.org/"
license=('MIT')
makedepends=('cmake')
source=("https://github.com/Microsoft/SEAL/archive/${pkgver}.tar.gz")
sha256sums=('616653498ba8f3e0cd23abef1d451c6e161a63bd88922f43de4b3595348b5c7e')

provides=('sealcrypto')

build() {
  cd ${srcdir}
  tar xf ${pkgver}.tar.gz
  cd SEAL-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr .
  make -j
}

package() {
  cd ${srcdir}/SEAL-${pkgver}
  install -m644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  make install
}
