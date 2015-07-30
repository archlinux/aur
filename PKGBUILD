# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=kompare
pkgname=kompare-kde4
pkgver=14.12.3
pkgrel=1
pkgdesc='Diff/Patch Frontend for KDE4'
url='http://kde.org/applications/development/kompare/'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('kde-applications' 'kdesdk')
depends=("libkomparediff2-kde4" 'kdebase-runtime')
makedepends=('cmake' 'automoc4')
conflicts=('kdesdk-kompare' 'kompare')
replaces=('kdesdk-kompare' 'kompare')
provides=('kdesdk-kompare' 'kompare')
install=${pkgname}.install
source=("http://download.kde.org/stable/applications/${pkgver}/src/kompare-${pkgver}.tar.xz")
sha1sums=('7d8d52baa812db4e382df77f66b00aa2d9babe01')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../kompare-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}

