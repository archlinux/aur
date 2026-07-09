# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Matthias Baur <aur@matthiasbaur.me>

pkgname=noson-app
pkgver=5.7.1
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
source=("git+https://github.com/janbar/noson-app.git#tag=${pkgver}")
sha256sums=('14be259877431780b951079272cf13fc11a300bf5b5d3e0ba0446a8202e3f23c')

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
