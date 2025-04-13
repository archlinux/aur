# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=noson
pkgver=2.12.9
pkgrel=2
pkgdesc="C++ library for accessing SONOS devices"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/janbar/noson"
license=(GPL-3.0-only)
makedepends=(cmake git)
options=(!lto)
source=("git+https://github.com/janbar/noson.git#tag=${pkgver}")
sha256sums=('5c981076e3a5cb32ff6d2eae26c42a04ad9415f9c664a3b8b789d440e41271c8')

build() {
  local _flags=(
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  )

  cmake -B build -S "noson" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
