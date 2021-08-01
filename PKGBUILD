# Maintainer: Giuseppe Calà <gcala (at) mailbox (dot) org>

pkgname=vakzination-git
_pkgname=vakzination
pkgver=r68.690b1a6
pkgrel=1
pkgdesc="Vakzination manages your health certificates like vaccination, test, and recovery certificates"
arch=(x86_64 aarch64)
url="https://invent.kde.org/plasma-mobile/vakzination"
license=(LGPL)
provides=($_pkgname)
conflicts=($_pkgname)
depends=(qt5-declarative kcodecs karchive qt5-svg khealthcertificate kitinerary)
makedepends=(git extra-cmake-modules prison)
source=("git+https://invent.kde.org/plasma-mobile/vakzination.git")
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
