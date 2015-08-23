# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: anex <assassin.anex[@]gmail.com

pkgname=signon-kwallet-extension-frameworks-git
pkgver=r19.9def002
pkgrel=1
pkgdesc="KWallet signon extension for the KF5 development version"
arch=('i686' 'x86_64')
url="http://kde.org"
license=('LGPL')
depends=('signon-qt5' 'kwallet')
conflicts=('signon-kwallet-extension')
makedepends=('cmake' 'git' 'extra-cmake-modules')
source=('git://anongit.kde.org/signon-kwallet-extension.git')
sha1sums=('SKIP')

pkgver() {
  cd signon-kwallet-extension
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../signon-kwallet-extension \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
}
