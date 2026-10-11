# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: thyTwilightGoth <https://aur.archlinux.org/account/thyTwilightGoth>
# Contributor: Pedro <https://aur.archlinux.org/account/PedroHLC>

pkgname=wlcs
pkgver=1.8.1
pkgrel=2
pkgdesc="Canonical's protocol-conformance-verifying test suite for Wayland compositor implementations."
arch=(x86_64 armv7h aarch64)
url="https://github.com/canonical/wlcs"
license=("GPL-2.0-or-later OR GPL-3.0-or-later")
depends=(
    glibc
    gtest
    libasan
    libgcc
    libstdc++
    libtsan
    libubsan
    wayland
    )
makedepends=(
    boost
    cmake
    git
    wayland-protocols
    )
#source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
source=("https://github.com/canonical/wlcs/releases/download/v${pkgver}/wlcs-${pkgver}.tar.xz")
sha512sums=('405ebec014bbe553c266a0b872e70dc8349e3e6ca2b8810e7c3acd605fa83b238a57551ba6af889eb34fded9523de1f0595799a422737ecb2d0132c1436d9a4d')

build() {
  export CFLAGS+=" -Wno-error=deprecated-declarations"
  export CXXFLAGS+=" -Wno-error=deprecated-declarations"

	local _flags=(
    -DCMAKE_INSTALL_LIBDIR=lib/
    -DCMAKE_INSTALL_LIBEXECDIR=bin/
	)

  cmake -B build -S "wlcs-${pkgver}" -Wno-author \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
