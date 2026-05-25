# Maintainer: Evilleader <evilleader91@gmail.com>
pkgname=vulkan-low-latency-layer-bin
_pkgname=low_latency_layer
pkgver=r17.g7797cae
pkgrel=1
pkgdesc="Vulkan layer for hardware agnostic input latency reduction (Reflex & Anti-Lag 2 on any GPU)"
arch=('x86_64' 'aarch64')
url="https://github.com/Korthos-Software/low_latency_layer"
license=('MIT')
depends=('glibc' 'gcc-libs' 'vulkan-loader')
makedepends=('git' 'cmake' 'vulkan-headers' 'vulkan-utility-libraries')
provides=('vulkan-low-latency-layer')
conflicts=('vulkan-low-latency-layer')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
