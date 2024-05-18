# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>
_backend=openmpi
pkgname=charm++-${_backend}
pkgver=7.0.1
pkgrel=1
pkgdesc="Adaptive Message Passing Interface, OpenMPI backend"
arch=(x86_64)
license=(Apache-2.0)
url="https://charmplusplus.org"
depends=(openmpi)
makedepends=(gcc-fortran)
source=(charm-${pkgver}.tar.gz::https://github.com/UIUC-PPL/charm/archive/v${pkgver}.tar.gz)
sha512sums=('baed3a7823f004ae24a6c49b5cdccc468ce36dcd5988e4d35ad19865a20e68939963ae9411a8afe8b9e3850d82a6a7b93085afc3f7e6de7e5a6877e19508e637')

build() {
  cd charm-${pkgver}
  ./buildold charm++ mpi-linux-$CARCH --with-production
}

package() {
  cd charm-${pkgver}
  make -C tmp install DESTDIR="${pkgdir}/opt/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
