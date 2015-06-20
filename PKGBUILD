# Maintainer: Sándor Nagy <sanya868 at gmail dot com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: mosra <mosra@centrum.cz>

pkgname=libkomparediff2-git
pkgver=r263.1e58d07
pkgrel=1
pkgdesc="Library to compare files and strings. (GIT version)"
url='https://projects.kde.org/projects/kde/kdesdk/libkomparediff2'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kio')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'cmake')
conflicts=('libkomparediff2')
provides=('libkomparediff2')
source=("git://anongit.kde.org/libkomparediff2")
sha1sums=('SKIP')

pkgver() {
  cd libkomparediff2
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake ../libkomparediff2 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
