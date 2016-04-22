# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=libkscreen
pkgver=5.6.3
pkgrel=1
pkgdesc='KDE screen management software'
arch=('i686' 'x86_64')
url='https://www.kde.org/workspaces/plasmadesktop/'
license=('LGPL')
depends=('qt5-x11extras' 'libxrandr' 'kwayland')
makedepends=('extra-cmake-modules')
conflicts=('libkscreen-frameworks')
replaces=('libkscreen-frameworks')
provides=('libkscreen-frameworks')
source=("http://download.kde.org/stable/plasma/${pkgver}/libkscreen-$pkgver.tar.xz")
md5sums=('6d19479c61e5bb96424b78b7572fbf48')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libkscreen-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
