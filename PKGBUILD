# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=koko-git
pkgver=r612.0b82195
pkgrel=1
arch=('x86_64')
pkgdesc="Image gallery application designed for desktop and touch devices"
url="https://invent.kde.org/graphics/koko"
license=('LGPL2.1')
depends=('kirigami2' 'kcoreaddons' 'kguiaddons' 'kconfig' 'knotifications' 'exiv2')
makedepends=('extra-cmake-modules' 'qt5-tools')
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
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S ${pkgname%-git}
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}