# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kauth-git
pkgver=r79.6dcb8d0
pkgrel=1
pkgdesc='KAuth'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kauth'
license=('LGPL')
depends=('kcoreaddons-git' 'polkit-qt5')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-tools')
groups=('kf5')
conflicts=(kauth)
provides=(kauth)
source=('git://anongit.kde.org/kauth.git')
md5sums=('SKIP')

pkgver() {
  cd kauth
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kauth \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
