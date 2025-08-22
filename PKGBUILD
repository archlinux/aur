# Maintainer: User8395 <therealuser8395@proton.me>
pkgname=plasma-dialer-git
pkgver=todo
pkgrel=0
pkgdesc="Dialer for Plasma Mobile - Git version"
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
makedepends=(cmake extra-cmake-modules-git)
sha256sums=('SKIP')

pkgver() {
  cd "plasma-dialer"
  printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

