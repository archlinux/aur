# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

pkgname=telepathy-kde-contact-list-git
pkgver=r1031.a13bfde
pkgrel=1
pkgdesc='KDE Telepathy contact list application'
arch=('i686' 'x86_64')
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=('GPL')
depends=('telepathy-kde-common-internals-git')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'python')
conflicts=('telepathy-kde-contact-list')
replaces=('telepathy-kde-contact-list-frameworks-git')
source=("git://anongit.kde.org/ktp-contact-list.git")
sha256sums=('SKIP')

pkgver() {
  cd ktp-contact-list
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ktp-contact-list \
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
