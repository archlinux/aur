# Maintainer: Vaishnav Sabari Girish <vaishnav.sabari.girish@gmail.com>

pkgname=miru-zoom
_pkgname=miru
pkgver=0.3.0
pkgrel=1
pkgdesc="A Wayland-based zoom daemon and control utility"
arch=('x86_64' 'aarch64')
url="https://github.com/Vaishnav-Sabari-Girish/miru"
license=('unknown')
depends=('wayland')
makedepends=('cmake' 'ninja' 'pkgconf' 'wayland-protocols')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cd063d58f754ca24dfb288b948a568e14aa94b7dd6b910f4da294322ad5904e0')

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
