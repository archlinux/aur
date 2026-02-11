# Maintainer: Arnold Kole <a.h.kole@uu.nl>
pkgname=xmlf90
pkgver=1.6.3
pkgrel=1
pkgdesc="A fast XML parser and generator in Fortran"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/siesta-project/libraries/${pkgname}"
license=('BSD2')
makedepends=(gcc-fortran cmake)
checkdepends=(gcc-fortran cmake)
options=(staticlibs)
source=(https://gitlab.com/siesta-project/libraries/xmlf90/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('79a30b60cfff4fbcb299ae86697b39c3e54c8b8811adeffa41a0df82bc70500b')

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
