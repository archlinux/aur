# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kreport-git
pkgver=2.96.0.r912.15bbc24
pkgrel=1
pkgdesc="A framework for creation and generation of reports in multiple formats. (GIT version)"
url='https://www.kde.org/applications/graphics/kreport'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kross' 'kproperty-git')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'python')
conflicts=('kreport')
provides=('kreport')
source=('git://anongit.kde.org/kreport.git')
sha1sums=('SKIP')

pkgver() {
  cd kreport
  _ver="$(cat CMakeLists.txt | grep -m1 KREPORT_VERSION | cut -d '"' -f2)"
  echo -e "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake ../kreport \
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
