# Maintainer: Sandwich Farm <maintainers@sandwich.farm>
pkgname=hyprlax
pkgver=2.2.1
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
sha256sums=('664029f0dd000c6d568a77d2aee1bbb104a5b0b3d00b8f57911704f5fd04ddaf')

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
