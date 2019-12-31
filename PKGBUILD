# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=sealcrypto
pkgver=3.4.5
pkgrel=2
pkgdesc='Microsoft library for fully homomorphic encryption'
arch=('x86_64')
url="https://sealcrypto.org/"
license=('MIT')
makedepends=('cmake')
source=("https://github.com/Microsoft/SEAL/archive/${pkgver}.tar.gz")
sha1sums=('4275f9c1e8bffb83467d80c644b41e1fe2454183')
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
