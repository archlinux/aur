# Maintainer: Donald Carr<sirspudd@gmail.com>

#set -o errexit
#set -o xtrace

pkgname=libconnman-qt-git
pkgver=20210114.f5b49d8
pkgrel=1
pkgdesc='Qt Quick wrappers for connman'
arch=('x86_64')
url='https://github.com/sailfishos/libconnman-qt'
license=('GPL')
provides=('libconnman-qt')
conflicts=('libconnman-qt')
depends=('qt5-tools' 'qt5-base' 'qt5-declarative' 'connman')
makedepends=('qt5-base')
source=("git+https://github.com/sailfishos/libconnman-qt.git")
sha256sums=('SKIP')

pkgver () {
  cd ${srcdir}/libconnman-qt
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
    cd ${srcdir}/libconnman-qt
    patch -p1 < ${startdir}/0001-Don-t-use-MeeGo-as-prefix-in-order-to-make-this-a-co.patch
}

build() {
    cd ${srcdir}/libconnman-qt
    qmake
    make
}

package() {
    cd ${srcdir}/libconnman-qt
    INSTALL_ROOT="$pkgdir" make install
}
