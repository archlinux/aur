# Maintainer: Andrew Shark <ashark @ at @ linuxcomp.ru>

pkgname=zanshin-git
pkgver=v21.11.90.r292.31195a7a
pkgrel=1
pkgdesc="To-do management application for KDE"
arch=(x86_64)
url="https://invent.kde.org/pim/zanshin"
license=(GPL)
depends=(kdepim-runtime kontactinterface)
makedepends=(git extra-cmake-modules kdoctools5 boost)
source=(git+https://invent.kde.org/pim/zanshin.git)
sha256sums=('SKIP')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}
