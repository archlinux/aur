# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Antonio Rojas

pkgname=prison-frameworks-git
pkgver=r75.8f25e5a
pkgrel=1
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kdesupport/prison'
pkgdesc="Barcode api currently offering a nice Qt api to produce QRCode barcodes and DataMatrix barcodes. KF5 Frameworks branch (GIT version)"
license=('LGPL')
depends=('libdmtx' 'qrencode' 'qt5-base')
makedepends=('extra-cmake-modules' 'git')
source=("git://anongit.kde.org/prison.git#branch=frameworks")
sha1sums=('SKIP')
_gitname=prison

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -fr build
  mkdir -p build
}

build() {
  cd build
  cmake "../${_gitname}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
