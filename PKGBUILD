# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=skanlite-frameworks-git
pkgver=1.1.0.r210.0999e40
pkgrel=1
pkgdesc="A Lite image scanning application. KF5 Frameworks branch (GIT version)"
arch=('i686' 'x86_64')
url="http://www.kde.org/applications/graphics/skanlite"
license=('GPL')
depends=('libksane-git'
         'kio'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'cmake'
             'python'
             )
conflicts=('skanlite')
source=('git://anongit.kde.org/skanlite#branch=frameworks')
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
