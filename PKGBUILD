# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=libkscreen
pkgver=5.4.2
pkgrel=1
pkgdesc='KDE screen management software'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/libs/libkscreen'
license=('LGPL')
depends=('qt5-x11extras' 'libxrandr')
makedepends=('extra-cmake-modules')
conflicts=('libkscreen-frameworks')
replaces=('libkscreen-frameworks')
provides=('libkscreen-frameworks')
source=("http://download.kde.org/stable/plasma/${pkgver}/libkscreen-$pkgver.tar.xz")
md5sums=('5b3c52fbf0172dfcf749cde12ebb48f3')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../libkscreen-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
