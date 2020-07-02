# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=alligator-git
pkgver=v1.1.r77.gfa18968
pkgrel=1
pkgdesc="Kirigami-based RSS reader"
arch=(x86_64)
url="https://invent.kde.org/plasma-mobile/alligator"
license=(GPL3)
depends=(ki18n kcoreaddons kconfig syndication kirigami2)
makedepends=(git cmake extra-cmake-modules)
provides=(alligator)
conflicts=(alligator)
source=("git+https://invent.kde.org/plasma-mobile/alligator.git")
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
