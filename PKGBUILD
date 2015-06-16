# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kruler-git
pkgver=5.0.r513.b24d9f2
pkgrel=1
pkgdesc="A pixel measuring tool for KDE. (GIT version)"
url='https://www.kde.org/applications/graphics/kruler'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kxmlgui' 'knotifications' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'python')
conflicts=('kdegraphics-kruler' 'kruler')
provides=('kruler')
source=('git://anongit.kde.org/kruler.git')
sha1sums=('SKIP')
install=kruler-git.install

pkgver() {
  cd kruler
  _ver="$(cat main.cpp | grep '// version' | cut -d '"' -f2)"
  echo -e "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake ../kruler \
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
