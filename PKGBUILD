# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Timothée Ravier <tim@siosm.fr>

pkgname=networkmanager-qt-git
pkgver=v5.74.0.r1.g7ab48a2
pkgrel=1
pkgdesc='Qt wrapper for NetworkManager API'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(networkmanager qt5-base)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc git)
conflicts=('libnm-qt5' 'networkmanager-qt' 'libnm-qt-git')
provides=('libnm-qt5' 'networkmanager-qt')
replaces=('libnm-qt-git')
source=("git+https://invent.kde.org/frameworks/networkmanager-qt")
sha256sums=('SKIP')

pkgver() {
  cd networkmanager-qt
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S networkmanager-qt \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
