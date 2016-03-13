pkgname=kigo-git
pkgver=v14.12.0.59.g62e3750
pkgrel=1
pkgdesc="An open-source implementation of the popular Go game. (GIT version)"
arch=('i686' 'x86_64')
url='https://www.kde.org/applications/games/kigo/'
license=('GPL')
depends=('qt5-base'
         'qt5-svg'
         'kcoreaddons'
         'kconfig'
         'kcrash'
         'kdbusaddons'
         'kdoctools'
         'kconfigwidgets'
         'ktextwidgets'
         'kxmlgui'
         'kio'
         'knotifyconfig'
         'knewstuff'
         'hicolor-icon-theme'
         'libkdegames'
         )
makedepends=('extra-cmake-modules'
             'git'
             )
conflicts=('kdegames-kigo')
source=('git://anongit.kde.org/kigo.git#branch=frameworks')
sha1sums=('SKIP')

pkgver() {
  cd kigo
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kigo \
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
