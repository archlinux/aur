# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=directxtex
pkgdesc="Texture processing library"
# Version from CMakeLists.txt.
pkgver=2.0.9
_tag=oct2025
pkgrel=1
arch=('x86_64')
depends=('directx-headers-cmake' 'directxmath')
makedepends=('cmake' 'ninja')
url="https://go.microsoft.com/fwlink/?LinkId=248926"
license=('MIT')
options=('staticlibs' '!strip')
source=(directxtex-${_tag}.tar.gz::https://github.com/microsoft/DirectXTex/archive/refs/tags/${_tag}.tar.gz)
sha256sums=('d3de2f2de6209dcd468e3d29612488034601cdcc22f6f9976a836ace75f84991')

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
