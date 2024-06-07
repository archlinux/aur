# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>
_backend=openmpi
pkgname=charm++-${_backend}
pkgver=8.0.0
pkgrel=1
pkgdesc="Adaptive Message Passing Interface, OpenMPI backend"
arch=(x86_64)
license=(Apache-2.0)
url="https://charmplusplus.org"
depends=(openmpi)
makedepends=(gcc-fortran)
source=(charm-${pkgver}.tar.gz::https://github.com/UIUC-PPL/charm/archive/v${pkgver}.tar.gz)
sha512sums=('e05ce57bf9bea0bd7b5e0a5b692ee881d384eb50dca42a3be3df81d33fea130287b28921ac6a24fdef90d6b99fbdcd2cc879d1679ec4b514b7833cb74d39f998')

build() {
  cd charm-${pkgver}
  ./buildold charm++ mpi-linux-$CARCH --with-production
}

package() {
  cd charm-${pkgver}
  make -C tmp install DESTDIR="${pkgdir}/opt/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
