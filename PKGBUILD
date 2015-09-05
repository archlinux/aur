# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libkcompactdisc-frameworks-git
pkgver=v15.08.0.5.gf8374a1
pkgrel=1
pkgdesc="library for interfacing with CDs. KF5 Frameworks branch. (GIT version)"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdemultimedia/libkcompactdisc'
license=('GPL' 'LGPL' 'FDL')
depends=('phonon-qt5'
         'kcoreaddons'
         'ki18n'
         'solid'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'python'
             )
conflicts=('libkcompactdisc')
source=('git://anongit.kde.org/libkcompactdisc.git#branch=frameworks')
sha1sums=('SKIP')

pkgver() {
  cd libkcompactdisc
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libkcompactdisc \
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
