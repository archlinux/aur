# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kmag-frameworks-git
pkgver=r457.98e532e
pkgrel=1
pkgdesc="A screen magnifier. KF5 Frameworks branch (GIT version)"
url='http://kde.org/applications/utilities/kmag'
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kio' 'libkdeaccessibilityclient-git' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'python')
conflicts=('kdegraphics-kmag' 'kmag')
provides=('kmag')
source=('git://anongit.kde.org/kmag#branch=frameworks')
sha1sums=('SKIP')
install=kmag-frameworks-git.install

pkgver() {
  cd kmag
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kmag \
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
