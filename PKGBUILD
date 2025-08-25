# Maintainer: User8395 <therealuser8395@proton.me>
pkgname=plasma-dialer
pkgver=24.08.0
pkgrel=1
pkgdesc="Dialer for Plasma Mobile"
arch=(x86_64 i686 i486 pentium4 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/plasma-dialer"
license=('GPL3')
groups=()
depends=(
  ki18n
  kcontacts
  kpeople
  knotifications
  kio
  kirigami-addons
  plasma-wayland-protocols
  modemmanager-qt
  libphonenumber
  callaudiod
)
makedepends=(cmake extra-cmake-modules)
source=("https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('a79cec66a0ea585b401fc8f926a5f80a4a2e9eed225c25403560a3d1e02d59c4')

prepare() {
  mkdir -p build
}

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
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
