# Maintainer: Antonio Rojas <arojas@archlinux,org>

pkgname=kseexpr-qt6-git
pkgver=6.0.0.0.r20.g871d4a3
pkgrel=1
pkgdesc='An embeddable expression evaluation engine (Krita fork)'
arch=(x86_64)
url='https://krita.org'
license=(GPL-3.0-or-later)
provides=(kseexpr-qt6)
conflicts=(kseexpr-qt6 kseexpr)
depends=(gcc-libs
         glibc
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
source=(git+https://invent.kde.org/graphics/kseexpr.git)
sha256sums=('SKIP')

pkgver() {
  cd kseexpr
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed "s/^v//g"
}

build() {
  cmake -B build -S kseexpr \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_DEMOS=OFF \
    -DBUILD_TESTS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
