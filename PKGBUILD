# Maintainer: User8395 <therealuser8395@proton.me>
_pkgname=kuserfeedback
pkgname=kuserfeedback-git
pkgver=6.27.0.r2.g0ae6f79
pkgrel=1
pkgdesc="Framework for collecting user feedback for applications via telemetry and surveys (Git version)"
arch=(any)
url="https://invent.kde.org/libraries/kuserfeedback.git"
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(gcc-libs glibc qt6-base)
makedepends=(git extra-cmake-modules-git clang qt6-charts qt6-declarative qt6-svg qt6-tools)
conflicts=(kuserfeedback kuserfeedback5)
provides=(kuserfeedback)
source=("git+https://invent.kde.org/libraries/kuserfeedback.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_pkgname \
    -DBUILD_TESTING=OFF \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
