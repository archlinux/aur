# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Dennis Twardowsky <aur@devpty.de>

pkgname=noson-app-git
pkgver=5.6.8.r0.g8326e67
pkgrel=1
pkgdesc="SONOS controller for Linux platforms"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/janbar/noson-app"
license=(GPL-3.0-only)
depends=(qt5-base qt5-quickcontrols2 qt5-declarative)
makedepends=(cmake git qt5-svg)
provides=(noson-app)
conflicts=(noson-app)
source=("git+https://github.com/janbar/noson-app.git")
sha256sums=('SKIP')

pkgver() {
  cd noson-app
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _flags=(
    -DBUILD_LIBNOSON:BOOL=ON
  )

  cmake -B build -S "noson-app" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

