# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kronometer-frameworks-git
pkgver=1.5.2.r274.6225d13
pkgrel=1
pkgdesc="A stopwatch application for KDE KF5 Frameworks branch (GIT version)"
arch=('i686' 'x86_64')
url='http://www.digikam.org/sharedlibs'
license=('GPL' 'LGPL' 'FDL')
depends=('kio' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'python')
conflicts=('kronometer')
source=('git://anongit.kde.org/kronometer.git#branch=frameworks')
sha1sums=('SKIP')
install=kronometer-frameworks-git.install

pkgver() {
  cd kronometer
  _ver="$(cat src/main.cpp | grep '// version' | cut -d '"' -f2)"
  echo -e "${_ver// /.}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare(){
  mkdir -p build
}

build() {
  cd build
  cmake ../kronometer \
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
