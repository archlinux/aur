# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: thyTwilightGoth <https://aur.archlinux.org/account/thyTwilightGoth>
# Contributor: Pedro <https://aur.archlinux.org/account/PedroHLC>

pkgname=wlcs
pkgver=1.7.0
pkgrel=1
pkgdesc="Canonical's protocol-conformance-verifying test suite for Wayland compositor implementations."
url='https://github.com/MirServer/wlcs'
arch=(x86_64 i686 aarch64)
license=(GPL)
depends=(glibc gcc-libs gtest wayland) #boost-libs
makedepends=(git cmake boost wayland-protocols)
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('e45a93819ad37b2594e4bde6a784fda6f96e427fa9d125f606433b3ad9d816dfd2f7adacaf93238909de117e7af37779ad7d3ade8c0535ca81fdd629de026057')

## Todo, fix: "wlcs E: ELF file ('usr/libexec/wlcs/wlcs') outside of a valid path."

build() {
  export CFLAGS+=" -Wno-error=unused-result -Wno-error=maybe-uninitialized"
  export CXXFLAGS+=" -Wno-error=unused-result -Wno-error=maybe-uninitialized"

	local _flags=(
    -DCMAKE_INSTALL_LIBDIR=lib/
	)

  cmake -B build -S "wlcs-${pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
