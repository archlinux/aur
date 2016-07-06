# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=kasync-git
pkgver=r88.6bc6092
pkgrel=1
pkgdesc='A C++ library for controlling asynchronous tasks'
arch=('i686' 'x86_64')
url='https://github.com/KDE/kasync'
license=('GPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules' 'git')
conflicts=(kasync)
provides=(kasync)
source=("git://anongit.kde.org/kasync.git")
sha256sums=('SKIP')

pkgver() {
  cd kasync
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() { 
  cd build
  cmake ../kasync \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
