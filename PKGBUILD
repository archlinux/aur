# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Timothée Ravier <tim@siosm.fr>

pkgname=networkmanager-qt-git
pkgver=r678.cf2d3da
pkgrel=1
pkgdesc='Qt-only wrapper for NetworkManager DBus API'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/libs/libnm-qt'
license=('LGPL')
depends=('qt5-base' 'networkmanager')
makedepends=('extra-cmake-modules-git' 'git')
conflicts=('libnm-qt5' 'networkmanager-qt' 'libnm-qt-git')
provides=('libnm-qt5' 'networkmanager-qt')
replaces=('libnm-qt-git')
source=("git://anongit.kde.org/networkmanager-qt.git")
sha256sums=('SKIP')

pkgver() {
  cd networkmanager-qt
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../networkmanager-qt \
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
