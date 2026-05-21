# Maintainer: User8395 <therealuser8395@proton.me>
pkgname=plasma-dialer
pkgver=6.6.5
pkgrel=1
pkgdesc="Dialer for Plasma Mobile"
arch=(any)
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
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('2df74c6b683bf08034e82caf60baae4d5dba541f54d8ba7fe38afc7a89a9acad')

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
