# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=skanlite-git
pkgver=1.1.0.r217.ff1f58b
pkgrel=1
pkgdesc="A Lite image scanning application. (GIT version)"
arch=('i686' 'x86_64')
url='http://www.kde.org/applications/graphics/skanlite'
license=('GPL')
depends=('libksane'
         'kio'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'cmake'
             'python'
             )
conflicts=('skanlite'
           'skanlite-frameworks-git'
           )
source=('git://anongit.kde.org/skanlite')
sha1sums=('SKIP')

pkgver() {
  cd skanlite
  _ver="$(cat CMakeLists.txt | grep -m1 SKANLITE_VERSION_STRING | cut -d '"' -f2)"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../skanlite \
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
