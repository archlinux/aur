# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libktorrent-frameworks-git
pkgver=1.9.50.r339.52032ca
pkgrel=1
pkgdesc="A BitTorrent protocol implementation. KF5 Frameworks branch. (GIT version)"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/network/libktorrent'
license=('GPL')
depends=('qca-qt5'
         'kio')
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'python'
             'boost'
             )
conflicts=('libktorrent')
source=('git://anongit.kde.org/libktorrent.git#branch=frameworks')
sha1sums=('SKIP')

pkgver() {
  cd libktorrent
  _ver="$(cat CMakeLists.txt | grep -m1 LIBKTORRENT_VERSION | cut -d '"' -f2)"
  echo -e "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libktorrent \
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
