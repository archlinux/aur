# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kinit
pkgver=5.4.0
pkgrel=1
pkgdesc='Process launcher to speed up launching KDE applications'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kinit'
license=('LGPL')
depends=('kio')
makedepends=('extra-cmake-modules' 'kdoctools')
groups=('kf5')
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz")
md5sums=('fb7ace9196147831921eacb682074b40')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
