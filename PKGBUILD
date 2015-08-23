# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

pkgname=telepathy-kde-common-internals-git
pkgver=r1790.bec1480
pkgrel=1
pkgdesc='Common components for KDE-Telepathy'
arch=(i686 x86_64)
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=(GPL)
depends=(knotifyconfig ktexteditor kpeople telepathy-qt5 kaccounts-integration-git libotr hicolor-icon-theme telepathy-mission-control telepathy-logger-qt-git)
makedepends=(extra-cmake-modules git kdoctools doxygen python)
conflicts=(telepathy-kde-common-internals)
source=("git://anongit.kde.org/ktp-common-internals.git")
sha256sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd ktp-common-internals
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ktp-common-internals \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
