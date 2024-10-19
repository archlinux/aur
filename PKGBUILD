# Maintainer: Luca Weiss <aur (at) lucaweiss (dot) eu>

pkgname=khealthcertificate-git
_pkgname=khealthcertificate
pkgver=24.01.90.r5.gd469570
pkgrel=1
pkgdesc="Handling of digital vaccination, test and recovery certificates"
arch=(x86_64)
url="https://invent.kde.org/pim/khealthcertificate"
license=(LGPL-2.0-or-later)
provides=($_pkgname)
conflicts=($_pkgname)
depends=(gcc-libs
         glibc
         karchive
         kcodecs
         ki18n
         openssl
         qt6-base
         zlib)
makedepends=(git extra-cmake-modules qt6-declarative)
optdepends=('qt6-declarative: QML bindings')
source=("git+https://invent.kde.org/pim/khealthcertificate.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_pkgname \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
