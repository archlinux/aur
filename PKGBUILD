# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=phonon-qt5-mpv-git
pkgver=v0.0.6.0.g91bec0f
pkgrel=1
pkgdesc="Phonon Backend using MPV Player. (GIT version)"
arch=('x86_64')
url='https://github.com/OpenProgger/phonon-mpv'
license=('GPL')
depends=('mpv'
         'phonon-qt5'
         'qt5-x11extras'
         )
makedepends=('extra-cmake-modules'
             'git'
             'qt5-tools'
             )
provides=('phonon-qt5-backend')
conflicts=('phonon-qt5-mpv')
replaces=('phonon-qt5-mpv')
source=('git+https://github.com/OpenProgger/phonon-mpv.git')
sha256sums=('SKIP')

pkgver() {
  cd phonon-mpv
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../phonon-mpv \
    -DCMAKE_BUILD_TYPE=Mone \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_SKIP_RPATH=ON

  make
}


package () {
  make -C build DESTDIR="${pkgdir}" install
}
