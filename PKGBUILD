# Maintainer: Arnold Kole <a.h.kole@uu.nl>
pkgname=libpsml
pkgver=1.1.12
pkgrel=1
pkgdesc="A library to handle pseudopotentials in PSML format"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/siesta-project/libraries/${pkgname}"
license=('BSD2')
depends=('xmlf90>=1.5.6')
makedepends=(gcc-fortran cmake)
checkdepends=(gcc-fortran cmake)
options=(staticlibs)
source=(https://gitlab.com/siesta-project/libraries/libpsml/uploads/b8e912c8d83bfbbcbcf68dd62926ec0e/$pkgname-$pkgver.tar.gz)
sha256sums=('b013be8586aba4e0411dfe6b1752892a0605ed20018ae5762d2a16898f48ccd9')

build() {
  cd "$pkgname-$pkgver"

  cmake -S. -B_build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_PREFIX_PATH=/usr
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
