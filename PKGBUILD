# Maintainer: l0gic <l0gic@invalid.invalid>
# Contributor: alba4k <blaskoazzolaaaron@gmail.com>

pkgname="hyprsunset"
pkgver=0.1.0
pkgrel=1
pkgdesc="An application to enable a blue-light filter on Hyprland"
arch=(any)
url="https://github.com/hyprwm/hyprsunset"
license=('BSD-3-Clause')
depends=('wayland' 'hyprland' 'hyprutils' 'wayland-protocols')
makedepends=('cmake' 'gcc' 'hyprwayland-scanner' 'hyprland-protocols')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/hyprwm/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('88c9fb2c3efb3ccb398c66a90658765312faf818678a6a8e0e727cfba5f13a9b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX=/usr -S . -B ./build
  cmake --build ./build --config Release --target hyprsunset
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
