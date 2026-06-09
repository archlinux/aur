# Maintainer: Sandwich Farm <maintainers@sandwich.farm>
pkgname=hyprlax
pkgver=2.2.3
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
sha256sums=('d9d5db3b2363d4b0d1fa92763dd9ba6fc401151db93450f744f265f51f56d247')

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
