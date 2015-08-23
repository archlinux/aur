# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

pkgname=telepathy-kde-approver-git
pkgver=r246.15c82c4
pkgrel=1
pkgdesc='KDE Channel Approver for Telepathy'
arch=('i686' 'x86_64')
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=('GPL')
depends=('telepathy-qt5' 'knotifications')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'python')
conflicts=('telepathy-kde-approver')
replaces=('telepathy-kde-approver-frameworks-git')
source=("git://anongit.kde.org/ktp-approver.git")
sha256sums=('SKIP')

pkgver() {
  cd ktp-approver
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ktp-approver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc 
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
