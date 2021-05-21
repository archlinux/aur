# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libkcddb-git
pkgver=21.04.1.6.g24d5755
pkgrel=1
pkgdesc="KDE CDDB library. (GIT version)"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdemultimedia/libkcddb'
license=('GPL' 'LGPL' 'FDL')
depends=('kio'
         'libmusicbrainz5'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'python'
             )
conflicts=('libkcddb')
provides=('libkcddb')
source=('git+https://invent.kde.org/multimedia/libkcddb.git/')
sha256sums=('SKIP')

pkgver() {
  cd libkcddb
  echo "$(git describe --long --tags | tr - . |tr -d v)"
}

prepare() {
  mkdir -p build
}

build() {

  cd build
  cmake ../libkcddb \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
