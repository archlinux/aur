# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Matthias Baur <aur@matthiasbaur.me>

pkgname=noson-app
pkgver=5.7.6
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
    vulkan-icd-loader
    )
source=("git+https://github.com/janbar/noson-app.git#tag=${pkgver}")
sha256sums=('31f0ebd28ca1ac89a561ba9c37275e618e49ecd2ad27165c7ef0a56451938df2')

build() {
  local _flags=(
  )

  cmake -B build -S "noson-app" -Wno-author \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
