# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=audiocd-kio-git
pkgver=16.07.0.r815.ad922e0
pkgrel=1
pkgdesc="Kioslave for accessing audio CDs. (GIT version)"
arch=('i686' 'x86_64')
url='https://www.kde.org/applications/multimedia'
license=('GPL' 'LGPL' 'FDL')
depends=('cdparanoia'
         'kdelibs4support'
         'libkcddb-git'
         'libkcompactdisc-git'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'python'
             )
conflicts=('kdemultimedia-audiocd-kio'
           'audiocd-kio'
           )
provides=('audiocd-kio')
source=('git://anongit.kde.org/audiocd-kio.git')
sha1sums=('SKIP')

pkgver() {
  cd audiocd-kio
  _ver="$(cat CMakeLists.txt | grep -m1 PROJECT_VERSION | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../audiocd-kio \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
