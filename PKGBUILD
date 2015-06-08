# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=knotifications-git
pkgver=r108.b792a14
pkgrel=1
pkgdesc='KNotifications'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/knotifications'
license=('LGPL')
depends=('libdbusmenu-qt5' 'phonon-qt5' 'kservice-git' 'kiconthemes-git')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-tools' 'python')
groups=('kf5')
conflicts=(knotifications)
provides=(knotifications)
source=('git://anongit.kde.org/knotifications.git')
md5sums=('SKIP')

pkgver() {
  cd knotifications
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../knotifications \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
