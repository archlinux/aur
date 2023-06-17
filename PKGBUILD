# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=directxtex
pkgdesc="Texture processing library"
# Version from CMakeLists.txt.
pkgver=1.9.9
_tag=jun2023
pkgrel=1
arch=('x86_64')
depends=('directx-headers-cmake' 'directxmath')
makedepends=('cmake' 'ninja')
url="https://go.microsoft.com/fwlink/?LinkId=248926"
license=('MIT')
options=('staticlibs' '!strip')
source=(directxtex-${_tag}.tar.gz::https://github.com/microsoft/DirectXTex/archive/refs/tags/${_tag}.tar.gz)
sha256sums=('51f0ff3bee0d1015c110e0c92ebdd9704aa6acd91185328fd92f10b9558f4c62')

build() {
  cmake -S DirectXTex-$_tag -B build -G Ninja \
    -DBUILD_DX11=OFF \
    -DBUILD_DX12=OFF \
    -DBUILD_TOOLS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
