# Maintainer: Arnold Kole <a.h.kole@uu.nl>
pkgname=xmlf90
pkgver=1.5.6
pkgrel=1
pkgdesc="A fast XML parser and generator in Fortran"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/siesta-project/libraries/${pkgname}"
license=('BSD2')
makedepends=(gcc-fortran cmake)
checkdepends=(gcc-fortran cmake)
options=(staticlibs)
source=(https://gitlab.com/siesta-project/libraries/xmlf90/uploads/a22bcf780219eda20423d8aae6e72331/$pkgname-$pkgver.tar.gz)
sha256sums=('b45b1919a671de2bf7b5ebf0eeffffe5d78414fb367dc40ca6e718b22143c9b3')

build() {
  cd "$pkgname-$pkgver"

  cmake -S. -B_build -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build _build
}

check() {
  cd "$pkgname-$pkgver"

  pushd _build; ctest ; popd
}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir/" cmake --install _build
}
