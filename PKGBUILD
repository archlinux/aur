# Maintainer: User8395 <therealuser8395@proton.me>
pkgname=plasma-dialer-git
pkgver=6.3.90.r13.g387b2b8
pkgrel=1
pkgdesc="Dialer for Plasma Mobile"
arch=(any)
url="https://invent.kde.org/plasma-mobile/plasma-dialer"
license=('GPL3')
depends=(
  ki18n-git
  kcontacts-git
  kpeople-git
  knotifications-git
  kio-git
  kirigami-addons-git
  plasma-wayland-protocols-git
  modemmanager-qt-git
  libphonenumber
  callaudiod-git
)

source=('git+https://invent.kde.org/plasma-mobile/plasma-dialer.git')
makedepends=(cmake extra-cmake-modules-git)
sha256sums=('SKIP')

pkgver() {
  cd "plasma-dialer"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cmake -B build -S plasma-dialer \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

