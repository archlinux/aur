# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=khealthcertificate-git
_pkgname=khealthcertificate
pkgver=r16.4b2cf8a
pkgrel=1
pkgdesc="Handling of digital vaccination, test and recovery certificates"
arch=(x86_64)
url="https://invent.kde.org/pim/khealthcertificate"
license=(LGPL)
provides=($_pkgname)
conflicts=($_pkgname)
# Needs -git versions of KF5 until at least KF5 5.84
depends=(qt5-declarative kcodecs-git karchive-git)
makedepends=(git extra-cmake-modules-git)
source=("git+https://invent.kde.org/pim/khealthcertificate.git")
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
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
