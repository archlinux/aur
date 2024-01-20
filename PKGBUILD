# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=elisa-git
pkgver=24.01.90.r14.g82824891
pkgrel=1
arch=(x86_64)
pkgdesc="Simple music player aiming to provide a nice experience for its users"
url="https://community.kde.org/Elisa"
license=(LGPL-3.0-or-later)
depends=(kcolorscheme kconfig kconfigwidgets kcoreaddons kcrash kdbusaddons kfilemetadata ki18n kiconthemes kio kirigami kitemviews kxmlgui qqc2-desktop-style qt6-base qt6-declarative qt6-multimedia)
makedepends=(extra-cmake-modules git kdoctools python)
provides=(elisa)
conflicts=(elisa)
source=("git+https://invent.kde.org/multimedia/elisa.git")
sha512sums=('SKIP')

pkgver() {
  cd elisa
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S elisa \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package(){
  DESTDIR="$pkgdir" cmake --install build
}
