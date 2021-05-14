# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=qqc2-breeze-style-git
pkgver=v5.21.90.r0.g64bf35d
pkgrel=1
pkgdesc="Breeze inspired QQC2 Style"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma/qqc2-breeze-style"
license=('GPL3')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols2' 'kirigami2')
makedepends=('git' 'extra-cmake-modules' 'qt5-tools')
provides=('qqc2-breeze-style')
conflicts=('qqc2-breeze-style')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -B build -S "${pkgname%-git}"
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
}