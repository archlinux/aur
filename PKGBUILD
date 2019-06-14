# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=sealcrypto
pkgver=3.3.0
pkgrel=1
pkgdesc='Simple Encrypted Arithmetic Library'
arch=('x86_64')
url="https://sealcrypto.org/"
license=('MIT')
makedepends=('cmake')
source=("https://github.com/Microsoft/SEAL/archive/${pkgver}.tar.gz")
sha1sums=('f516c85537c6d092f05b52af8b46e4e8d92891ad')
provides=('sealcrypto')

build() {
  cd ${srcdir}
  tar xf ${pkgver}.tar.gz
  cd SEAL-${pkgver}/native/src
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr .
  make
}

package() {
  cd ${srcdir}/SEAL-${pkgver}
  install -m644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cd native/src
  make install
}
