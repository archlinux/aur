# Maintainer: Aditya Mehra <aix (dot) m (at) outlook (dot) com>

_pkgname=aura-browser
pkgname=aura-browser-git
pkgver=r01.2c4005d0
pkgrel=1
pkgdesc="Browser for a fully immersed Big Screen experience allowing you to navigate the world wide web using just your remote control"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://invent.kde.org/Plasma-Bigscreen/aura-browser/"
license=('GPL3')
depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-multimedia' 'qt5-declarative' 'qt5-webengine' 'qt5-webchannel' 'qt5-virtualkeyboard' 'qt5-graphicaleffects' 'kirigami2' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav' 'plasma-bigscreen-git')
makedepends=('git' 'cmake' 'extra-cmake-modules')
optdepends=('mycroft-gui-git')
provides=("aura-browser")
conflicts=("aura-browser")
install=$pkgname.install
source=('git+https://invent.kde.org/Plasma-Bigscreen/aura-browser')
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
