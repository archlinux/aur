# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Timothée Ravier <tim@siosm.fr>

_pkgname=modemmanager-qt
pkgname=modemmanager-qt-git
pkgver=r457.70e7a3a
pkgrel=1
pkgdesc='Qt wrapper for ModemManager DBus API'
arch=(i686 x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(modemmanager qt5-base)
makedepends=(extra-cmake-modules doxygen git qt5-tools qt5-doc)
groups=(kf5)
conflicts=(libmm-qt5 libmm-qt-git modemmanager-qt)
provides=(modemmanager-qt)
replaces=(libmm-qt-git)
source=("git+https://github.com/KDE/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$_pkgname
  mkdir -p build
}

build() {
  cd $srcdir/$_pkgname/build
  cmake ../ \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd $srcdir/$_pkgname/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING.LIB "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
