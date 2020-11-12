# Maintainer: Martin Stolpe <martin dot stolpe at gmail dot com>
# Contributor Antonio Rojas <arojas@archlinux.org>

_pkgname=kuserfeedback
pkgname=kuserfeedback-git
pkgver=r704.83982f1
pkgrel=1
pkgdesc="Framework for collecting user feedback for applications via telemetry and surveys"
arch=(x86_64)
url="https://kde.org/products/frameworks/"
license=(GPL)
depends=(qt5-base)
makedepends=(extra-cmake-modules qt5-tools clang qt5-charts qt5-svg qt5-declarative git)
optdepends=('qt5-declarative: QML bindings' 'qt5-charts: User Feedback console' 'qt5-svg: User Feedback console')
conflicts=(kuserfeedback)
provides=(kuserfeedback)
source=("git+https://invent.kde.org/libraries/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S $_pkgname \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
