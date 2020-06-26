# Maintainer: Aditya Mehra <aix (dot) m (at) outlook (dot) com>

_pkgname=mycroft-gui
pkgname=mycroft-gui-git
pkgver=r01.4c9fa11
pkgrel=1
pkgdesc="Mycroft Graphical User Interface for Mycroft AI"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/MycroftAI/mycroft-gui/"
license=('APACHE')
depends=('qt5-base' 'qt5-websockets' 'qt5-quickcontrols2' 'qt5-multimedia' 'qt5-webengine' 'qt5-declarative' 'qt5-webview')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'plasma-framework' 'kio' 'kio-extras')
optdepends=('mycroft-core: for using "Installed Using Mycroft Package"')
provides=("mycroft-gui")
conflicts=("mycroft-gui")
install=$pkgname.install
source=('git+https://github.com/MycroftAI/mycroft-gui')
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
