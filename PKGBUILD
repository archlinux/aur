# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kdevelop-valgrind-git
pkgver=r1116.2e096e1
pkgrel=1
pkgdesc="A plugin offering a full integration of the valgrind suite to KDevelop. (GIT version)"
arch=('i686' 'x86_64')
url='http://www.kdevelop.org'
license=('GPL')
depends=('qt5-base' 'valgrind')
conflicts=('kdevelop-valgrind' 'kdev-valgrind')
provides=('kdevelop-valgrind')
makedepends=('cmake' 'git' 'extra-cmake-modules')
source=("git://anongit.kde.org/kdev-valgrind.git")
sha1sums=('SKIP')

pkgver() {
  cd kdev-valgrind
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../kdev-valgrind \
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
