# $Id$
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Andrea Scarpino <and...@archlinux.org>

pkgname=kactivities4
pkgver=4.13.3
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc='API for using and interacting with the Activity Manager'
url='https://projects.kde.org/projects/kde/kdelibs/kactivities'
license=('GPL' 'FDL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4' 'mesa')
conflicts=('kactivities' 'kactivities-frameworks')
provides=("kactivities==${pkgver}")
source=("http://download.kde.org/Attic/${pkgver}/src/kactivities-${pkgver}.tar.xz")
sha1sums=('54813db8808da63dda7980711ba5d4e01e56d2b0')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../kactivities-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_NepomukCore=OFF
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}
