# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=kronos
pkgver=2.7.0
pkgrel=1
pkgdesc="Sega Saturn emulator, fork of yabause"
arch=(x86_64 aarch64 i686 pentium4)
url="https://github.com/FCare/Kronos"
license=(GPL-2.0-or-later)
depends=(openal qt5-base qt5-multimedia sdl2 libglvnd glibc gcc-libs)
makedepends=(cmake glu)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FCare/Kronos/archive/refs/tags/${pkgver}_official_release.tar.gz")
b2sums=('67ff8a57f61e733a67281c7d0af84b4c20209088b957dec911e926b250770050b015671df604104c070db97ef7018394a1a355b1017d24e155f3af999ef05a7f')

build() {
  export CFLAGS+=" -Wno-error=format-security"
  export CXXFLAGS+=" -Wno-error=format-security"

  cmake -B build -S "Kronos-${pkgver}_official_release/yabause" \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DYAB_USE_QT5=ON

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
