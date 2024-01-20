# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dtkwidget-git
pkgver=5.6.22.r0.g0a97de24
pkgrel=1
pkgdesc='Deepin graphical user interface library'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dtkwidget"
license=('LGPL3')
depends=('deepin-qt-dbus-factory' 'dtkcore' 'dtkgui' 'librsvg' 'qt5-multimedia' 'qt5-svg'
         'qt5-x11extras' 'startup-notification')
makedepends=('git' 'qt5-tools' 'gtest' 'dtkcommon' 'dtkcore' 'dtkgui' 'cmake' 'ninja' 'doxygen')
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
      -DMKSPECS_INSTALL_DIR=lib/qt/mkspecs/modules/\
      -DBUILD_PLUGINS=OFF \
      -DBUILD_DOCS=ON \
      -DQCH_INSTALL_DESTINATION=share/doc/qt \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release 
  cmake --build build
}

package() {
  cd $pkgname/build
  DESTDIR="$pkgdir" ninja install
}
