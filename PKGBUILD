# Maintainer: User8395 <therealuser8395@proton.me>
_pkgname=modemmanager-qt
pkgname=modemmanager-qt-git
pkgver=6.27.0.r1.g0c779de
pkgrel=1
pkgdesc='Qt wrapper for ModemManager DBus API'
arch=(any)
url='https://invent.kde.org/frameworks/modemmanager-qt'
license=(LGPL)
depends=(modemmanager qt6-base)
makedepends=(cmake extra-cmake-modules-git doxygen qt6-tools)
groups=(kf6-git)
conflicts=(libmm-qt5 libmm-qt-git modemmanager-qt)
replaces=(libmm-qt-git)
source=("git+https://invent.kde.org/frameworks/modemmanager-qt")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
