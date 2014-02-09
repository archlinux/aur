# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-wayland-git
pkgver=0.0.0
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtWayland)"
arch=('i686' 'x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('qt5-base' 'qt5-declarative' 'libxcomposite' 'wayland')
makedepends=('git' 'qtchooser')
conflicts=('qt5-wayland')
options=('!libtool' 'debug')
source=(git://gitorious.org/qt/qtwayland.git#branch=stable)
md5sums=('SKIP')

pkgver() {
  cd qtwayland
  git describe --always | sed 's|-|.|g'
}

build() {
  export QT_SELECT=5

  cd qtwayland
  qmake CONFIG+=wayland-compositor
  make
}

package() {
  cd qtwayland
  make INSTALL_ROOT="${pkgdir}" install
}
