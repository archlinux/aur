# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=libkscreen
pkgver=5.7.2
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
groups=(plasma)
source=("http://download.kde.org/stable/plasma/${pkgver}/libkscreen-$pkgver.tar.xz"{,.sig})
sha256sums=('2ad615811937bbbb2ab12becc7f0d47db0ff10e36fd516c1d697fa087453b77a'
            'SKIP')
validpgpkeys=('13C16D03EDE728514473AA73A506E6D4DD4D5088'  # Jonathan Riddell
              'D07BD8662C56CB291B316EB2F5675605C74E02CF') # David Edmundson

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
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
