# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kclock-git
pkgver=r157.e96a786
pkgrel=1
pkgdesc="Clock app for Plasma Mobile"
arch=(x86_64)
url="https://invent.kde.org/plasma-mobile/kclock"
license=(GPL3)
depends=(ki18n kconfig kcoreaddons knotifications kdbusaddons kirigami2 kirigami-addons-git)
makedepends=(git cmake extra-cmake-modules)
provides=(kclock)
conflicts=(kclock)
source=("git+https://invent.kde.org/plasma-mobile/kclock.git")
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
