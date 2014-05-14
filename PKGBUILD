# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kinit
pkgver=4.99.0
pkgrel=1
pkgdesc='KInit'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kinit'
license=('LGPL')
depends=('kio')
makedepends=('extra-cmake-modules' 'kdoctools')
groups=('kf5')
source=("http://download.kde.org/unstable/frameworks/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('45fcb76799f85869ed4861957a4750a7')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DECM_MKSPECS_INSTALL_DIR=/usr/share/qt/mkspecs/modules \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
