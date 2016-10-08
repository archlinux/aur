# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libkcompactdisc-git
pkgver=16.08.0.r333.60135da
pkgrel=1
pkgdesc="library for interfacing with CDs. (GIT version)"
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
provides=('libkcompactdisc')
source=('git://anongit.kde.org/libkcompactdisc.git')
sha256sums=('SKIP')

pkgver() {
  cd libkcompactdisc
  _ver="$(cat CMakeLists.txt | grep -m1 PROJECT_VERSION | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libkcompactdisc \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
