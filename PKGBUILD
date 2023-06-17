# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Laurent Carlier <lordheavym@archlinux.org>
# Contributor: Cyano Hao <c@cyano.cn>

pkgname=directx-headers-cmake
pkgdesc="DirectX headers for using D3D12 (cmake version)"
pkgver=1.610.2
pkgrel=1
arch=('x86_64')
makedepends=('cmake' 'ninja')
url="https://github.com/microsoft/DirectX-Headers"
license=('MIT')
source=(directx-headers-${pkgver}.tar.gz::https://github.com/microsoft/DirectX-Headers/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('59492497e99bd3c23f8f8aa8a709f4d7b5bc5bd5057efa8c568bbad40015a8b2')

# This does not exactly provide "directx-headers"
# due to missing pkg-config, but it conflicts.
# This is an upstream issue.

conflicts=('directx-headers')

build() {
  cmake -S DirectX-Headers-$pkgver -B build -G Ninja \
    -DDXHEADERS_BUILD_TEST=OFF \
    -DDXHEADERS_BUILD_GOOGLE_TEST=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
