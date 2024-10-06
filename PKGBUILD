# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: thyTwilightGoth <https://aur.archlinux.org/account/thyTwilightGoth>
# Contributor: Pedro <https://aur.archlinux.org/account/PedroHLC>

pkgname=wlcs
pkgver=1.7.0
pkgrel=4
pkgdesc="Canonical's protocol-conformance-verifying test suite for Wayland compositor implementations."
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/canonical/wlcs"
license=(G'PL-2.0-or-later OR GPL-3.0-or-later')
depends=(glibc gcc-libs gtest wayland) #boost-libs
makedepends=(git cmake boost wayland-protocols)
#source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
source=("https://github.com/canonical/wlcs/releases/download/v${pkgver}/wlcs-${pkgver}.tar.xz")
sha512sums=('ac8d33eef2ba7ebaaff46967e23f353c7eb41035568f3c703a05fe8f291602487b4b5a7e71ff72d00c41eaa8283a8fc4e5d3533385a449794986f667ae292240')

build() {
  export CFLAGS+=" -Wno-error=unused-result -Wno-error=maybe-uninitialized"
  export CXXFLAGS+=" -Wno-error=unused-result -Wno-error=maybe-uninitialized"

	local _flags=(
    -DCMAKE_INSTALL_LIBDIR=lib/
    -DCMAKE_INSTALL_LIBEXECDIR=bin/
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
