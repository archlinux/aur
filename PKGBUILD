# Maintainer: Arnold Kole <a.h.kole@uu.nl>
pkgname=libfdf
pkgver=0.5.1
pkgrel=1
pkgdesc="LibFDF is the official implementation of the FDF specifications for use in client codes"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/siesta-project/libraries/${pkgname}"
license=('BSD3')
makedepends=(gcc-fortran cmake)
checkdepends=(gcc-fortran cmake)
options=(staticlibs)
source=(https://gitlab.com/siesta-project/libraries/libfdf/uploads/e1774d1bd63db5edfdcadbe3972bbfcc/$pkgname-$pkgver.tar.gz)
sha256sums=('b53dbd00b6dfca769ade7228502236958864c134081a9b018e49e81f4057efb6')

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
