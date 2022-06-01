# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Jekyll Wu <adaptee [at] gmail dot com>

pkgname=kamule
pkgver=0.91
pkgrel=2
pkgdesc="A KDE frontend for aMule"
arch=('x86_64')
url='https://www.linux-apps.com/content/show.php?content=150270'
license=('GPL')
depends=('amule-daemon'
         'kio'
         'kpty'
         'hicolor-icon-theme'
         )
makedepends=('extra-cmake-modules'
             'python'
             )
#source=("https://dl.opendesktop.org/api/files/downloadfile/id/1466632134/s/2e53ec56530c00b50e3619c46b962da2/t/1523631790/u/76637/150270-${pkgname}-${pkgver}.tar.bz2")
source=("${pkgname}-${pkgver}.tar.bz2::https://github.com/nihui/kamule/archive/refs/heads/master.zip")
# sha256sums=('5e0f3abbc0ff1543abcbb9cfade7bb5658b2c6865c12e9b33a3bd1612592971d')
sha256sums=('69b63b15636e8696d2494bae2d820f38fee0598f77235601e80fcdbfa675d816')
options=('debug')

prepare() {
  sed '26a#include <QAction>' -i "${pkgname}-master/preferencepage.cpp"
}

build() {
  cmake -S "${pkgname}-master" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
