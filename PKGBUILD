# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=calindori-git
pkgver=r512.0efd700
pkgrel=1
pkgdesc="Calendar for Plasma Mobile"
arch=(x86_64)
url="https://invent.kde.org/plasma-mobile/calindori"
license=(GPL3)
depends=(ki18n kcoreaddons kconfig kcalendarcore kirigami2
         kdbusaddons knotifications kservice kpeople qt5-svg)
makedepends=(git extra-cmake-modules qt5-tools)
provides=(calindori)
conflicts=(calindori)
source=("git+https://invent.kde.org/plasma-mobile/calindori.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "${pkgname%-git}"
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
