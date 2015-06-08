# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=bluez-qt-git
pkgver=r296.840aecb
pkgrel=1
pkgdesc='Qt wrapper for Bluez 5 DBus API'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/playground/libs/libbluedevil'
license=(GPL2)
depends=(qt5-declarative bluez)
makedepends=(extra-cmake-modules git)
provides=(bluez-qt)
conflicts=(libbluedevil-frameworks bluez-qt)
source=("git://anongit.kde.org/bluez-qt.git")
sha256sums=('SKIP')

pkgver() {
  cd bluez-qt
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../bluez-qt \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DUDEV_RULES_INSTALL_DIR=/usr/lib/udev/rules.d
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
