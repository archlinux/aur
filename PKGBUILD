# Maintainer: Vaishnav Sabari Girish <vaishnav.sabari.girish@gmail.com>

pkgname=miru-zoom
_pkgname=miru
pkgver=0.1.0
pkgrel=2
pkgdesc="A Wayland-based zoom daemon and control utility"
arch=('x86_64' 'aarch64')
url="https://github.com/Vaishnav-Sabari-Girish/miru"
license=('unknown')
depends=('wayland')
makedepends=('cmake' 'ninja' 'pkgconf' 'wayland-protocols')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1858e0baf7677824d0f1eb6c0969c3988ed8bbf1b319a3e1bb651ca1d0450a8c')

build() {
  cmake -B build -S "${_pkgname}-${pkgver}" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  install -Dm755 build/miru-daemon "${pkgdir}/usr/bin/miru-daemon"
  install -Dm755 build/miructl "${pkgdir}/usr/bin/miructl"
}
