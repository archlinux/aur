# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kweathercore-git
pkgver=release.0.1.1.r2.g7e84fac
pkgrel=1
pkgdesc="Library to facilitate retrieval of weather information including forecasts and alerts"
arch=(x86_64)
url="https://invent.kde.org/libraries/kweathercore"
license=(GPL3)
depends=('ki18n' 'qt5-location')
makedepends=('git' 'extra-cmake-modules')
provides=('kweathercore')
conflicts=('kweathercore')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "${pkgname%-git}"
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
