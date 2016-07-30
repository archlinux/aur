# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Antonio Rojas

pkgname=prison-frameworks-git
pkgver=r63.beb567b
pkgrel=1
pkgdesc="Barcode api currently offering a nice Qt api to produce QRCode barcodes and DataMatrix barcodes. (GIT version)"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kdesupport/prison'
license=('LGPL')
depends=('libdmtx'
         'qrencode'
         'qt5-base'
         )
makedepends=('extra-cmake-modules'
             'git'
             )
conflicts=('prison-frameworks')
provides=('prison-frameworks')
source=('git://anongit.kde.org/prison')
sha1sums=('SKIP')

pkgver() {
  cd prison
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../prison \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DQT5_BUILD=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
