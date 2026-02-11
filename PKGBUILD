# Maintainer: Arnold Kole <a.h.kole@uu.nl>
pkgname=libpsml
pkgver=2.1.0
pkgrel=1
pkgdesc="A library to handle pseudopotentials in PSML format"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/siesta-project/libraries/${pkgname}"
license=('BSD2')
depends=('xmlf90>=1.5.6')
makedepends=(gcc-fortran cmake)
checkdepends=(gcc-fortran cmake)
options=(staticlibs)
source=(https://gitlab.com/siesta-project/libraries/libpsml/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('2977d4a83c06cb4c1bbe870d192ab1efd335e5bb78ee8f5ac3d51ce2cd2c0c60')

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
