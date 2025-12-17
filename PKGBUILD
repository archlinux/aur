# Maintainer: Sandwich Farm <maintainers@sandwich.farm>
pkgname=hyprlax-git
pkgver=r137.57bfcbe
pkgrel=1
pkgdesc="Smooth parallax wallpaper animation for Hyprland and other Wayland compositors"
arch=('x86_64' 'aarch64')
url="https://github.com/sandwichfarm/hyprlax"
license=('MIT')
depends=('wayland' 'mesa')
makedepends=('git' 'wayland' 'wayland-protocols')
optdepends=(
  'hyprland: Hyprland IPC integration'
  'sway: Sway/i3 IPC integration'
  'river: River tag-based workspaces'
  'niri: Niri scrollable workspaces'
)
provides=('hyprlax')
conflicts=('hyprlax')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/hyprlax"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/hyprlax"
  make
}

# Optional: enable if test deps are available (check)
#check() {
#  cd "${srcdir}/hyprlax"
#  make test
#}

package() {
  cd "${srcdir}/hyprlax"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
