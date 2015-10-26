# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdevelop-pg-qt-git
pkgver=r594.3776ab9
pkgrel=1
pkgdesc="KDevelop Parser Generator, a LL(1) parser generator used by KDevelop language plugins. (GIT version)"
arch=('i686' 'x86_64')
url='http://www.kdevelop.org'
license=('GPL')
depends=('qt5-base')
conflicts=('kdevelop-pg-qt')
provides=('kdevelop-pg-qt-git')
makedepends=('cmake' 'git' 'extra-cmake-modules')
source=("git://anongit.kde.org/kdevelop-pg-qt.git")
sha1sums=('SKIP')

pkgver() {
  cd kdevelop-pg-qt
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../kdevelop-pg-qt \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
