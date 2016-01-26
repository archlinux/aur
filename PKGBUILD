# Maintainer: Zanny <lordzanny@gmail.com>
# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

_gitname=ktp-common-internals
pkgname=telepathy-kde-common-internals-git
pkgver=v15.12.0.r10.gcad98ea
pkgrel=1
pkgdesc='Common components for KDE-Telepathy'
arch=(i686 x86_64)
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=(GPL)
depends=(knotifyconfig ktexteditor kpeople telepathy-logger-qt kaccounts-integration libotr hicolor-icon-theme telepathy-accounts-signon)
makedepends=(extra-cmake-modules git kdoctools doxygen python)
conflicts=(telepathy-kde-common-internals)
source=("git://anongit.kde.org/$_gitname")
sha256sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_gitname \
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
