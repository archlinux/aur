# Maintainer: ebriouscoding <ebriouscoding at gmail dot com>
pkgname=akhenaten-git
pkgver=ra2506.51.g4e62e6f22
pkgrel=1
pkgdesc="Open-source engine for Pharaoh (+Cleopatra) city-building game"
arch=(x86_64)
url="https://github.com/dalerank/Akhenaten"
license=('AGPL-3.0-only')
depends=(sdl2 sdl2_mixer sdl2_image hicolor-icon-theme)
makedepends=(cmake git ninja glm)
optdepends=('libpng: needed for image loading')
provides=(akhenaten)
conflicts=(akhenaten)
source=(
  $pkgname::git+$url.git
)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --long --always | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  cmake -B build -S . \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir" cmake --install build
}
