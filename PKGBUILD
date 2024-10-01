# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=mauikit-imagetools-git
pkgver=4.0.0.r3.g9f35795
pkgrel=1
pkgdesc="MauiKit Image Tools Components"
arch=(x86_64 i686 armv7h aarch64)
url="https://invent.kde.org/maui/mauikit-imagetools"
license=(GPL3)
depends=(mauikit-git exiv2 tesseract leptonica kquickimageeditor kcoreaddons)
makedepends=(git extra-cmake-modules opencv)
provides=(mauikit-imagetools)
conflicts=(mauikit-imagetools)
source=("git+https://invent.kde.org/maui/mauikit-imagetools.git")
sha256sums=('SKIP')

pkgver() {
  cd "mauikit-imagetools"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "mauikit-imagetools" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
