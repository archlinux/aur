# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=aseman-qt-tools
pkgver=1.0.0+144+g9f37dcc
pkgrel=1
pkgdesc="the shared tools and functions used in the aseman's projects"
arch=('x86_64' 'i686')
license=('GPL3')
url="https://launchpad.net/libqtelegram"
depends=('qt5-multimedia' 'qt5-location' 'qt5-declarative' 'qt5-quickcontrols' 'qt5-sensors' 'qtkeychain')
makedepends=('cmake')
source=("$pkgname::git+https://github.com/Aseman-Land/aseman-qt-tools.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long | sed 's/\([^-]*-g\)/\1/;s/-/+/g' | sed 's/.stable//g' | sed 's/v//g'
}

prepare() {
  cd ${pkgname}
  mkdir -p build
}

build() {
  cd ${pkgname}/build
  qmake-qt5 -r QMAKE_CFLAGS_ISYSTEM= QT+=widgets QT+=multimedia QT+=dbus QT+=sensors QT+=positioning  ../asemantools.pro
  make
}

package() {
  cd ${pkgname}/build
  make INSTALL_ROOT="$pkgdir" install
}
