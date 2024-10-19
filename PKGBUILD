# Maintainer: Luca Weiss <aur (at) lucaweiss (dot) eu>

pkgname=kookbook-git
pkgver=0.2.1.r113.g56b0c4d
pkgrel=1
pkgdesc="Cookbook creator"
arch=(x86_64)
url="https://invent.kde.org/utilities/kookbook"
license=(MIT)
depends=(qt6-base qt6-declarative)
makedepends=(git extra-cmake-modules)
provides=(kookbook)
conflicts=(kookbook)
source=("git+https://invent.kde.org/utilities/kookbook.git")
sha512sums=('SKIP')

pkgver() {
  cd kookbook
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S kookbook \
    -DBUILD_TESTING=OFF \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 kookbook/COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
