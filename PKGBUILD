# Maintainer: birdflesh <antkoul at gmail dot com>
# Contributor: said
# Contributor: Panagiotis Papadopoulos <pano_90 AT gmx DOT net>

pkgname=kamoso
pkgver=2.98
_pkgver=3.0rc1
pkgrel=2
pkgdesc="An application to take pictures and videos out of your webcam for KDE"
url="https://projects.kde.org/projects/extragear/multimedia/kamoso"
arch=(i686 x86_64)
license=(GPL)
depends=(qt5-gstreamer kdeclarative gst-plugins-bad purpose)
makedepends=(extra-cmake-modules kdoctools)
source=("http://download.kde.org/unstable/kamoso/kamoso-$_pkgver.tar.xz")
install=$pkgname.install
md5sums=('357772498c21eca6ee3d8f9bc09ae0a0')

prepare() {
  mkdir -p build
}

build() {
  cd build 
  cmake ../$pkgname-$_pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF 
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
} 
