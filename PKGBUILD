# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=directxtex
pkgdesc="Texture processing library"
# Version from CMakeLists.txt.
pkgver=2.0.2
_tag=dec2023
pkgrel=1
arch=('x86_64')
depends=('directx-headers-cmake' 'directxmath')
makedepends=('cmake' 'ninja')
url="https://go.microsoft.com/fwlink/?LinkId=248926"
license=('MIT')
options=('staticlibs' '!strip')
source=(directxtex-${_tag}.tar.gz::https://github.com/microsoft/DirectXTex/archive/refs/tags/${_tag}.tar.gz)
sha256sums=('5a2c479aa976ea5cd26e5a4fb253eb634bab0c2c9456ac2f5bf9a14caa11d2e0')

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
