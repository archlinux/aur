# Maintainer: Martin Stolpe <martin dot stolpe at gmail dot com>
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
makedepends=(extra-cmake-modules doxygen git qt5-tools qt5-doc git)
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


build() {
  cmake -B build -S $_pkgname \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
