# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libkgapi-frameworks-git
pkgver=4.72.0.r663.ecd207b
pkgrel=1
pkgdesc="A KDE-based library for accessing various Google services via their public API. KF5 Frameworks branch (GIT version)"
url='http://www.dvratil.cz/category/akonadi-google/'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kcalcore-git' 'kcontacts-git')
makedepends=('extra-cmake-modules' 'kdoctools' 'git')
source=("git://anongit.kde.org/libkgapi#branch=frameworks")
sha1sums=('SKIP')

pkgver() {
  cd libkgapi
  _ver="$(cat CMakeLists.txt | grep KGAPI_LIB_VERSION | head -n1 | cut -d '"' -f2)"
  echo "$(echo ${_ver} | tr ' ' .).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libkgapi \
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
