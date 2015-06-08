# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kxmlgui-git
pkgver=r173.db71290
pkgrel=1
pkgdesc='KXmlGUI'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kxmlgui'
license=('LGPL')
depends=('kglobalaccel-git' 'ktextwidgets-git' 'attica-git')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(kxmlgui)
provides=(kxmlgui)
source=('git://anongit.kde.org/kxmlgui.git')
md5sums=('SKIP')

pkgver() {
  cd kxmlgui
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kxmlgui \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
