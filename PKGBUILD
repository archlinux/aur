# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dtkdeclarative-git
_pkgname=dtkdeclarative
pkgver=5.6.0.r27.g3c64962
pkgrel=1
pkgdesc='DTK declarative modules'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dtkdeclarative"
license=('LGPL3')
depends=('dtkgui-git' 'qt5-declarative' 'qt5-quickcontrols2')
makedepends=('git' 'qt5-tools')
conflicts=($_pkgname)
provides=($_pkgname)
groups=('deepin-git')
source=("git+https://github.com/linuxdeepin/dtkdeclarative.git")
sha512sums=('SKIP')

pkgver() {
    cd $srcdir/$_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  qmake-qt5 PREFIX=/usr DTK_VERSION=$pkgver LIB_INSTALL_DIR=/usr/lib DTK_QML_APP_PLUGIN_PATH=/usr/lib/dtkdeclarative/qml-app DDECLARATIVE_TRANSLATIONS_DIR=/
  make
}

package() {
  cd $srcdir/$_pkgname/
  make INSTALL_ROOT="$pkgdir" install
}
