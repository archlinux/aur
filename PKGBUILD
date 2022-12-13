# Maintainer: Adam Brenner <adam@aeb.io>
pkgname=pulsar-client-cpp
pkgver=3.1.0
pkgrel=1
pkgdesc='Apache Pulsar Client Libaries in C++'
arch=('x86_64')
url='https://github.com/apache/pulsar-client-cpp'
license=('Apache')
MAKEFLAGS="-j$(nproc)"
makedepends=('boost' 'cmake')
depends=('protobuf' 'openssl' 'curl' 'snappy')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apache/pulsar-client-cpp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d594a4f3603c90fa3bc4f635185ccc9629879aa6006b53fccf6784f339e795a1')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -D -m644 ${pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
