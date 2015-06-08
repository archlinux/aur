# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Timothée Ravier <tim@siosm.fr>

pkgname=modemmanager-qt-git
pkgver=r265.5e1184d
pkgrel=1
pkgdesc='Qt-only wrapper for ModemManager DBus API'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/extragear/libs/libnm-qt'
license=(LGPL)
depends=(modemmanager qt5-base)
makedepends=(extra-cmake-modules-git git)
conflicts=(libmm-qt5 libmm-qt-git modemmanager-qt)
provides=(modemmanager-qt)
replaces=(libmm-qt-git)
source=("git://anongit.kde.org/modemmanager-qt.git")
sha256sums=('SKIP')

pkgver() {
  cd modemmanager-qt
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../modemmanager-qt \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
