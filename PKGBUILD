# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=krename-git
pkgver=4.0.9.r285.8af8955
pkgrel=1
pkgdesc="A very powerful batch file renamer for KDE. (GIT Version)"
arch=('i686' 'x86_64')
url='http://www.krename.net'
license=('GPL')
depends=('kio'
         'taglib'
         'podofo'
         'kjs'
         'exiv2'
         'hicolor-icon-theme'
         )
makedepends=('git'
             'extra-cmake-modules'
             'python'
             'kdoctools'
             )
provides=('krename')
conflicts=('krename')
source=('git://anongit.kde.org/krename.git')
sha1sums=('SKIP')

pkgver() {
  cd krename
  _ver="$(cat CMakeLists.txt | grep -m1 KRENAME_VERSION | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../krename \
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
