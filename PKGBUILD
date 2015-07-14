# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Antonio Rojas

pkgname=prison-frameworks-git
pkgver=r75.8f25e5a
pkgrel=1
pkgdesc="Barcode api currently offering a nice Qt api to produce QRCode barcodes and DataMatrix barcodes. KF5 Frameworks branch. (GIT version)"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kdesupport/prison'
license=('LGPL')
depends=('libdmtx' 'qrencode' 'qt5-base')
makedepends=('extra-cmake-modules' 'git')
conflicts=('prison-frameworks' 'prison')
provides=('prison-frameworks' 'prison')
source=('git://anongit.kde.org/prison#branch=frameworks')
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
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
