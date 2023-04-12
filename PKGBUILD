# Maintainer: Arnold Kole <a.h.kole@uu.nl>
pkgname=libgridxc
pkgver=1.1.0
pkgrel=1
pkgdesc="A library for the computation of exchange and correlation energies and potentials in radial and 3D grids"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/siesta-project/libraries/${pkgname}"
license=('BSD3')
depends=('libxc' 'openmpi')
makedepends=(gcc-fortran cmake)
checkdepends=(gcc-fortran cmake)
options=(staticlibs)
source=(https://gitlab.com/siesta-project/libraries/libgridxc/uploads/6af4a9d60cb44be98b017cf2913de417/$pkgname-$pkgver.tar.gz)
sha256sums=('d05c8b601619567b34462b5c80c5959faf7feb6e26f4f8a77a083b75919a29b5')

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
