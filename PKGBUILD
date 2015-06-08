# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kolourpaint-frameworks-git
pkgver=r1960.fc5706e
pkgrel=1
pkgdesc="Paint Program. KF5 Frameworks branch (GIT version)"
url="http://kde.org/applications/graphics/kolourpaint/"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kdelibs4support' 'qimageblitz-qt5-svn' 'libkexiv2-frameworks-git' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kdoctools' 'git')
conflicts=('kdegraphics-kolourpaint' 'kolourpaint')
provides=('kolourpaint')
source=("git://anongit.kde.org/kolourpaint#branch=frameworks")
sha1sums=('SKIP')
install="kolourpaint-frameworks-git.install"

pkgver() {
  cd kolourpaint
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kolourpaint \
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
