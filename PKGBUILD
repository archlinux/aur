# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwindowsystem-git
pkgver=r136.487f03a
pkgrel=1
pkgdesc='KWindowSystem'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kwindowsystem'
license=('LGPL')
depends=('qt5-x11extras' 'libxfixes')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-tools')
groups=('kf5')
conflicts=(kwindowsystem)
provides=(kwindowsystem)
source=('git://anongit.kde.org/kwindowsystem.git')
md5sums=('SKIP')

pkgver() {
  cd kwindowsystem
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kwindowsystem \
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
