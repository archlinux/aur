# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: marcin mikołajczak <me@mkljczk.pl>

pkgname=tokodon-git
pkgver=22.09.r7.g9d96c2e
pkgrel=1
pkgdesc="Native Mastodon client"
arch=(x86_64)
url="https://invent.kde.org/network/tokodon"
license=(LGPL)
depends=(kirigami2 qtkeychain-qt5 kdbusaddons ki18n qt5-websockets knotifications kitemmodels)
makedepends=(extra-cmake-modules qt5-tools git qt5-svg qt5-multimedia qt5-websockets qt5-quickcontrols2 kcoreaddons
             ki18n knotifications knotifyconfig qqc2-desktop-style )
conflicts=(tokodon)
provides=(tokodon)
source=('git+https://invent.kde.org/network/tokodon.git')
sha256sums=('SKIP')

pkgver() {
  cd tokodon
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  [[ -d build ]] || mkdir build
}

build() {
  cd build
  cmake ../tokodon \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

