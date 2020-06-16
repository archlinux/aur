# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libktorrent-git
pkgver=2.2.0.r459.5bf1109
pkgrel=1
pkgdesc="A BitTorrent protocol implementation. (GIT version)"
arch=('x86_64')
url='https://projects.kde.org/projects/extragear/network/libktorrent'
license=('GPL')
depends=('qca-qt5'
         'kio'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'python'
             'boost'
             )
provides=('libktorrent')
conflicts=('libktorrent')
source=('git+https://invent.kde.org/network/libktorrent.git')
sha256sums=('SKIP')

pkgver() {
  cd libktorrent
  _ver="$(cat CMakeLists.txt | grep -m1 LIBKTORRENT_VERSION | cut -d '"' -f2)"
  echo -e "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  cd build
  cmake ../libktorrent \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF


}

build() {
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
