# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=alizams
pkgver=1.10.0
pkgrel=1
pkgdesc="Qt6 DICOM Viewer"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/AlizaMedicalImaging/AlizaMS"
license=(GPL-3.0-only)
depends=(
    glibc
    hicolor-icon-theme
    itk
    libgcc
    libstdc++
    qt6-5compat
    qt6-base
    )
makedepends=(
    cmake
    eigen
    git
    qt6-svg
    )
source=("git+https://github.com/AlizaMedicalImaging/AlizaMS.git#tag=v${pkgver}")
sha256sums=('90f3c2a97143ddbb91e0dadde7077958acd94e664ec43025d421855d515e92d5')

build() {
  local _flags=(
    -DALIZA_QT_VERSION:STRING=6
  )

  cmake -B build -S "AlizaMS" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
