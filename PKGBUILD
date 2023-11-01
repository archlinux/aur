# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: marcin mikołajczak <me@mkljczk.pl>

pkgname=tokodon-git
pkgver=23.08.2.r16.ge9f36469
pkgrel=2
pkgdesc="Native Mastodon client"
arch=(x86_64)
url="https://invent.kde.org/network/tokodon"
license=(LGPL)
depends=(kio5 kirigami2 kirigami-addons5 qtkeychain-qt5 kdbusaddons5 ki18n5 qt5-websockets knotifications5
         kitemmodels5 qqc2-desktop-style5 mpv

         # namcap implicit depends
         glibc gcc-libs kconfig5 qt5-base qt5-declarative qt5-quickcontrols2 kconfigwidgets5 kwindowsystem5 kcoreaddons5
         hicolor-icon-theme)
makedepends=(extra-cmake-modules git)
conflicts=(tokodon)
provides=(tokodon)
source=("git+https://invent.kde.org/network/tokodon.git#branch=release/23.08")
sha256sums=('SKIP')

pkgver() {
  cd tokodon
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S tokodon -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
