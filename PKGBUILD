# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dtkwidget-git
pkgver=5.6.3.r20.g99113616
pkgrel=1
pkgdesc='Deepin graphical user interface library'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dtkwidget"
license=('LGPL3')
depends=('deepin-qt-dbus-factory-git' 'dtkcore-git' 'dtkgui-git' 'librsvg' 'qt5-multimedia' 'qt5-svg'
         'qt5-x11extras' 'startup-notification')
makedepends=('git' 'qt5-tools' 'gtest' 'dtkcommon-git' 'dtkcore-git' 'dtkgui-git' 'cmake' 'ninja' 'doxygen')
provides=('dtkwidget')
conflicts=('dtkwidget')
groups=('deepin-git')
source=("$pkgname::git+https://github.com/linuxdeepin/dtkwidget")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd $pkgname
  cmake -B build -GNinja \
      -DHUNTER_ENABLED=OFF \
      -DMKSPECS_INSTALL_DIR=/usr/lib/qt/mkspecs/modules/\
      -DBUILD_PLUGINS=OFF \
      -DBUILD_DOCS=ON \
      -DQCH_INSTALL_DESTINATION=/usr/share/doc/qt \
      -DCMAKE_INSTALL_LIBDIR=/usr/lib \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd $pkgname/build
  DESTDIR="$pkgdir" ninja install
}
