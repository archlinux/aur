# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
 
pkgname=mauikit-git
pkgver=r1047.98e368c
pkgrel=1
pkgdesc='Utilities and "templated" controls based on Kirigami and QCC2 that follow the ongoing work on the Maui HIG'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://mauikit.org/"
license=(GPL3)
depends=(qt5-base qt5-declarative qt5-svg qt5-quickcontrols2 kio)
makedepends=(git cmake extra-cmake-modules qt5-webengine appstream syntax-highlighting)
provides=(mauikit)
conflicts=(mauikit)
source=("git+https://invent.kde.org/kde/mauikit.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname%-git}"
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}
 
package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
