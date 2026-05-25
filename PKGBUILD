# Maintainer: ***REMOVED*** <***REMOVED***>
_pkgname=low_latency_layer
pkgname=vulkan-low-latency-layer-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Vulkan layer for hardware agnostic input latency reduction (Reflex & Anti-Lag 2 on any GPU)"
arch=('x86_64' 'aarch64')
url="https://github.com/Korthos-Software/low_latency_layer"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cmake' 'vulkan-headers' 'vulkan-utility-libraries')
provides=('vulkan-low-latency-layer')
conflicts=('vulkan-low-latency-layer')
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
  cd "${_pkgname}"
  git checkout "v${pkgver}"
  
  cmake -B ../build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build ../build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
