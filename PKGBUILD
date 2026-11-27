# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>
_backend=openmpi
pkgname=ampi-${_backend}
pkgver=8.1.1
pkgrel=1
pkgdesc="Adaptive Message Passing Interface, OpenMPI backend"
arch=(x86_64)
license=(Apache-2.0)
url="http://charm.cs.uiuc.edu/research/ampi"
depends=(openmpi)
makedepends=(gcc-fortran)
source=(charm-${pkgver}.tar.gz::https://github.com/UIUC-PPL/charm/archive/v${pkgver}.tar.gz)
sha512sums=('9c11c812d5657c4f8edd7f6593afa69a546e5089c07e7d3cdf6178239db053ff889159a7fee8e437aff95ad72cefea3c87109293a4243b8bbff9dea2d1c7bcc0')

build() {
  cd charm-${pkgver}
  ./buildold AMPI mpi-linux-$CARCH --with-production -Wno-implicit-int
}

package() {
  cd charm-${pkgver}
  make -C tmp install DESTDIR="${pkgdir}/opt/ampi-${_backend}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
