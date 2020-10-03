# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=kpublictransport-git
_pkgname=kpublictransport
pkgver=r1324.4e58cf7
pkgrel=1
pkgdesc="Library to assist with accessing public transport timetables and other information"
arch=(x86_64)
url="https://kontact.kde.org"
license=(LGPL)
provides=($_pkgname)
conflicts=($_pkgname)
depends=(qt5-declarative)
makedepends=(git extra-cmake-modules)
source=("git+https://invent.kde.org/libraries/kpublictransport.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_pkgname \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
