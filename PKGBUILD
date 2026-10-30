# Maintainer: Sandwich Farm <maintainers@sandwich.farm>
pkgname=hyprlax
pkgver=2.2.8
pkgrel=1
pkgdesc="Smooth parallax wallpaper animation for Hyprland and other Wayland compositors"
arch=('x86_64' 'aarch64')
url="https://github.com/sandwichfarm/hyprlax"
license=('MIT')
depends=('wayland' 'mesa')
makedepends=('wayland' 'wayland-protocols')
optdepends=(
  'hyprland: Hyprland IPC integration'
  'sway: Sway/i3 IPC integration'
  'river: River tag-based workspaces'
  'niri: Niri scrollable workspaces'
)
source=("hyprlax-v${pkgver}.tar.gz::https://github.com/sandwichfarm/hyprlax/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8509e51939b014f146695df8d969b463ea2da5eed0d15548d36257efc6a720ce')

build() {
  cd "${srcdir}/hyprlax-${pkgver}"
  make
}

package() {
  cd "${srcdir}/hyprlax-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
