# Maintainer: Zanny <lordzanny@gmail.com>

_gitname=ktp-call-ui
pkgname=telepathy-kde-call-ui-git
pkgver=v0.8.80.r33.g1e1ff29
pkgrel=1
pkgdesc="Voice/Video Call UI for Telepathy"
arch=('i686' 'x86_64')
url="http://community.kde.org/Real-Time_Communication_and_Collaboration"
license=('GPL')
depends=('telepathy-kde-common-internals-git' 'qt5-gstreamer')
makedepends=('extra-cmake-modules' 'git' 'boost')
source=("git://anongit.kde.org/$_gitname")
sha256sums=('SKIP')

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
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
