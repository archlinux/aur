# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kweather-git
pkgver=v0.2.r30.g1f0a79b
pkgrel=1
pkgdesc="Weather application for Plasma Mobile"
arch=(x86_64)
url="https://invent.kde.org/plasma-mobile/kweather"
license=(GPL3)
depends=(ki18n kconfig kcoreaddons knotifications kirigami2 kdbusaddons plasma-framework)
makedepends=(git cmake extra-cmake-modules)
provides=(kweather)
conflicts=(kweather)
source=("git+https://invent.kde.org/plasma-mobile/kweather.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${pkgname%-git}"
  install -d build
}

build() {
  cd "${pkgname%-git}/build"
  cmake ..
  make
}

package() {
  cd "${pkgname%-git}/build"
  make DESTDIR="$pkgdir" install
}
