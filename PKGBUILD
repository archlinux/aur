# Maintainer: Aaron Cottle <a@aaroncottle.au>
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kstatusnotifieritem-git
pkgver=r202.gb0c774e
pkgrel=1
pkgdesc='Implementation of Status Notifier Items'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kwindowsystem-git
         qt6-base)
makedepends=(doxygen
             extra-cmake-modules-git
             qt6-doc
             qt6-tools)
source=(git+https://invent.kde.org/frameworks/kstatusnotifieritem.git)
sha256sums=('SKIP')

conflicts=('kstatusnotifieritem')
provides=('kstatusnotifieritem')

pkgver() {
  cd ${pkgname%-git}
  echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S kstatusnotifieritem \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
