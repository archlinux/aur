# Maintainer: Aditya Mehra <aix (dot) m (at) outlook (dot) com>

_pkgname=plank-player
pkgname=plank-player-git
pkgver=r01.3ba5ba8
pkgrel=1
pkgdesc="Multimedia Player for playing local files on Plasma Bigscreen"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://invent.kde.org/Plasma-Bigscreen/plank-player/"
license=('GPL')
depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-multimedia' 'qt5-declarative' 'kirigami2' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=("plank-player")
conflicts=("plank-player")
install=$pkgname.install
source=('git+https://invent.kde.org/Plasma-Bigscreen/plank-player')
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd $srcdir/$_pkgname/build
  make DESTDIR="$pkgdir/" install
}
