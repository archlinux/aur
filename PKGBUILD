# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libkcddb-frameworks-git
pkgver=v4.13.80.19.g1b6ba68
pkgrel=1
pkgdesc="KDE CDDB library. KF5 Frameworks branch (GIT version)"
url='https://projects.kde.org/projects/kde/kdemultimedia/libkcddb'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kio' 'libmusicbrainz5')
makedepends=('extra-cmake-modules' 'kdoctools' 'git')
conflicts=('libkcddb')
provides=('libkcddb')
source=("git://anongit.kde.org/libkcddb#branch=kf5")
sha1sums=('SKIP')

pkgver() {
  cd libkcddb
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libkcddb \
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