# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=directxtex
pkgdesc="Texture processing library"
pkgver=jan2023
pkgrel=1
arch=('any')
makedepends=('cmake' 'directx-headers-cmake' 'directxmath' 'ninja')
url="https://go.microsoft.com/fwlink/?LinkId=248926"
license=('MIT')
options=('staticlibs' '!strip')
source=(directxtex-${pkgver}.tar.gz::https://github.com/microsoft/DirectXTex/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('878107c0645742ac74f3aa0e1de504d618c685f76797503f02a8f75198f8c869')

build() {
  cmake -S DirectXTex-$pkgver -B build -G Ninja \
   -DBUILD_DX11=OFF \
   -DBUILD_DX12=OFF \
   -DBUILD_TOOLS=OFF

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
