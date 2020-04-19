# Maintainer: Stoian Minaev
 
pkgname=nota-git
pkgver=r166.7d70269
pkgrel=1
pkgdesc="Simple Text Editor for KDE"
arch=(x86_64)
url="https://vvave.kde.org/"
license=(GPL3)
depends=(ki18n knotifications qt5-quickcontrols2 qt5-svg kio mauikit-git kirigami2)
makedepends=(git cmake extra-cmake-modules syntax-highlighting appstream)
provides=(nota)
conflicts=(nota)
source=("git+https://invent.kde.org/kde/nota.git")
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
