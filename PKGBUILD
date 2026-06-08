# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Dennis Twardowsky <aur@devpty.de>

pkgname=noson-app-git
pkgver=5.7.1.r0.g261f21d
pkgrel=1
pkgdesc="SONOS controller for Linux platforms"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/janbar/noson-app"
license=(GPL-3.0-only)
depends=(
    qt6-5compat
    qt6-base
    qt6-declarative
    qt6-svg
    flac
    glibc
    hicolor-icon-theme
    libgcc
    libstdc++
    openssl
    sh
    zlib
    )
makedepends=(
    cmake
    git
    libpulse
    vulkan-headers
    )
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

