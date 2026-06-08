# Maintainer: Arnold Kole <a.h.kole@uu.nl>
pkgname=libgridxc
pkgver=2.0.3
pkgrel=1
pkgdesc="A library for the computation of exchange and correlation energies and potentials in radial and 3D grids"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/siesta-project/libraries/${pkgname}"
license=('BSD3')
depends=('libxc' 'openmpi')
makedepends=(gcc-fortran cmake)
checkdepends=(gcc-fortran cmake)
options=(staticlibs)
source=(https://gitlab.com/siesta-project/libraries/libgridxc/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('13aaa36fb2a1c30f38f0b94245dfb4fb5f7c58be68b45c7f359266261caf23b3')

build() {
  cd "$pkgname-$pkgver"

  cmake -S. -B_build -DWITH_MPI=ON -DWITH_LIBXC=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_PREFIX_PATH=/usr
  cmake --build _build
}

check() {
  cd "$pkgname-$pkgver"

  cmake --build _build --target test
}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir/" cmake --install _build
}
