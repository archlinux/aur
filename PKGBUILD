# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>
_backend=openmpi
pkgname=ampi-${_backend}
pkgver=8.1.0
pkgrel=1
pkgdesc="Adaptive Message Passing Interface, OpenMPI backend"
arch=(x86_64)
license=(Apache-2.0)
url="http://charm.cs.uiuc.edu/research/ampi"
depends=(openmpi)
makedepends=(gcc-fortran)
source=(charm-${pkgver}.tar.gz::https://github.com/UIUC-PPL/charm/archive/v${pkgver}.tar.gz)
sha512sums=('45584628d3a48979350972d706e25ab7c1b1e80957447e4f516064bfcc410d4d732c2f615811737e411c925991a85e8ccec4ce90f6a1a03f66315d78e1ced00b')

build() {
  cd charm-${pkgver}
  ./buildold AMPI mpi-linux-$CARCH --with-production -Wno-implicit-int
}

package() {
  cd charm-${pkgver}
  make -C tmp install DESTDIR="${pkgdir}/opt/ampi-${_backend}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
