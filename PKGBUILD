# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=spirv-cross-git
pkgver=r3920.5e7db829
pkgrel=1
pkgdesc="Tool and library for performing reflection on SPIR-V and disassembling SPIR-V back to high level languages"
arch=(x86_64)
url="https://github.com/KhronosGroup/SPIRV-Cross"
license=(Apache-2.0)
depends=(glibc gcc-libs)
makedepends=(cmake git python)
provides=(spirv-cross)
conflicts=(spirv-cross)
source=("git+https://github.com/KhronosGroup/SPIRV-Cross.git")
sha256sums=('SKIP')

pkgver() {
  cd "SPIRV-Cross"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  local _flags=(
    -D SPIRV_CROSS_FORCE_PIC:BOOL=ON
    -D SPIRV_CROSS_SHARED:BOOL=ON
  )

  cmake -B build -S "SPIRV-Cross" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
