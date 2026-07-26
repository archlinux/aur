# Maintainer: Vaishnav Sabari Girish <vaishnav.sabari.girish@gmail.com>

pkgname=miru-zoom
_pkgname=miru
pkgver=0.2.0
pkgrel=1
pkgdesc="A Wayland-based zoom daemon and control utility"
arch=('x86_64' 'aarch64')
url="https://github.com/Vaishnav-Sabari-Girish/miru"
license=('unknown')
depends=('wayland')
makedepends=('cmake' 'ninja' 'pkgconf' 'wayland-protocols')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ae4c10fb7b644e2c00e40090820f92d7bb00c558bc601d3c9a9607bf7f56ab94')

build() {
  cmake -B build -S "${_pkgname}-${pkgver}" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  # Installs binaries directly from the build directory
  install -Dm755 build/miru-daemon "${pkgdir}/usr/bin/miru-daemon"
  install -Dm755 build/miructl "${pkgdir}/usr/bin/miructl"
}
