# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dtkwidget-git
_commit=01aae7443a2ae7c3071d62ba8f428a8835e41249
_pkgname=dtkwidget
pkgver=5.6.0.2.r28.g01aae744
pkgrel=1
pkgdesc='Deepin graphical user interface library'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dtkwidget"
license=('LGPL3')
depends=('deepin-qt-dbus-factory-git' 'dtkcore-git' 'dtkgui-git' 'librsvg' 'qt5-multimedia' 'qt5-svg'
         'qt5-x11extras' 'startup-notification')
makedepends=('git' 'qt5-tools' 'gtest' 'dtkcommon-git' 'dtkcore-git' 'dtkgui-git' 'cmake' 'ninja')
provides=('dtkwidget')
conflicts=('dtkwidget')
groups=('deepin-git')
source=("$_pkgname.tar.gz::https://github.com/linuxdeepin/$_pkgname/archive/$_commit.tar.gz")
sha512sums=('04cd55bdc92c0c442440a13ba6fe7bf78658ce4ecabdb558a262218a71c6570f24c2f57c301ce8ebce3ff6016b216ce0b21b2fdb05733dc19ad8cd20284e4ced')

build() {
  cd $_pkgname-$_commit
  cmake -GNinja \
      -DHUNTER_ENABLED=OFF \
      -DMKSPECS_INSTALL_DIR=/usr/lib/qt/mkspecs/modules/\
      -DBUILD_PLUGINS=OFF \
      -DBUILD_DOCS=ON \
      -DQCH_INSTALL_DESTINATION=/usr/share/doc/qt \
      -DCMAKE_INSTALL_LIBDIR=/usr/lib \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release
  ninja
}

package() {
  cd $_pkgname-$_commit
  DESTDIR="$pkgdir" ninja install
}
