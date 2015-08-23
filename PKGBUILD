# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

pkgname=telepathy-kde-send-file-git
pkgver=r181.9397b1e
pkgrel=1
pkgdesc='A File manager plugin to launch a file transfer job with a specified contact'
arch=('i686' 'x86_64')
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=('GPL')
depends=('telepathy-kde-common-internals-git')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'python')
conflicts=('telepathy-kde-send-file')
replaces=('telepathy-kde-send-file-frameworks-git')
source=("git://anongit.kde.org/ktp-send-file.git")
sha256sums=('SKIP')

pkgver() {
  cd ktp-send-file
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ktp-send-file \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
