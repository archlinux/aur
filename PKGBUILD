# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: thyTwilightGoth <https://aur.archlinux.org/account/thyTwilightGoth>
# Contributor: Pedro <https://aur.archlinux.org/account/PedroHLC>

pkgname=wlcs
pkgver=1.8.1
pkgrel=1
pkgdesc="Canonical's protocol-conformance-verifying test suite for Wayland compositor implementations."
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/canonical/wlcs"
license=("GPL-2.0-or-later OR GPL-3.0-or-later")
depends=(glibc gcc-libs gtest wayland) #boost-libs
makedepends=(git cmake boost wayland-protocols)
#source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
source=("https://github.com/canonical/wlcs/releases/download/v${pkgver}/wlcs-${pkgver}.tar.xz")
sha512sums=('405ebec014bbe553c266a0b872e70dc8349e3e6ca2b8810e7c3acd605fa83b238a57551ba6af889eb34fded9523de1f0595799a422737ecb2d0132c1436d9a4d')

build() {
  #export CFLAGS+=" -Wno-error=unused-result -Wno-error=maybe-uninitialized"
  #export CXXFLAGS+=" -Wno-error=unused-result -Wno-error=maybe-uninitialized"

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
