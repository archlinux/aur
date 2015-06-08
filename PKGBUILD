# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=attica-qt5-git
pkgver=r488.0cd48c8
pkgrel=1
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kdesupport/attica'
pkgdesc='A Qt5 library that implements the Open Collaboration Services API'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules-git' 'git')
conflicts=('attica-qt5')
provides=('attica-qt5')
source=("git://anongit.kde.org/attica.git")
md5sums=('SKIP')

pkgver() {
  cd attica
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../attica \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
