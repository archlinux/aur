# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=redasm-beta
_pkgver=4.0.0-beta1
pkgver=${_pkgver//-/.}
pkgrel=1
url="https://github.com/redasm-dev/redasm"
arch=(x86_64)
pkgdesc="The OpenSource Disassembler"
license=(GPL-3.0-or-later)
depends=(
    glibc
    hicolor-icon-theme
    libgcc
    libstdc++
    qt6-base
    sqlite
    )
makedepends=(
    cmake
    git
    #patchelf
    qt6-tools
    vulkan-headers
    )
conflicts=(redasm)
provides=(redasm)
source=("redasm-workspace::git+https://github.com/redasm-dev/workspace.git#tag=v${_pkgver}")
sha256sums=('28ae34bb4845e35c5a05eb4a7ff6db665c034c94db052a2f25ac039d21163273')

prepare() {
  cd redasm-workspace
  cmake -P Setup.cmake
}

build() {
  local _flags=(

  )

  cmake -B build -S "redasm-workspace" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
