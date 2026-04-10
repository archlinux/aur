# Maintainer: lightjunction <lightjunction.me@gmail.com>
pkgname=dots-hyprland-fork-git
pkgver=0.0.0
pkgrel=1
pkgdesc='dots-hyprland fork - Hyprland config framework'
arch=(any)
url='https://github.com/LIghtJUNction/dots-hyprland'
license=(MIT)
depends=(
  hyprland
  quickshell
  fish
  starship
)
makedepends=(git)
install=${pkgname}.install
source=("git+https://github.com/LIghtJUNction/dots-hyprland.git")
sha256sums=('SKIP')

pkgver() {
  cd dots-hyprland
  local v
  v="$(git describe --tags 2>/dev/null | sed 's/^v//;s/-/./g')"
  printf '%s' "${v:-0.0.0}"
}

package() {
  cd dots-hyprland
  # Install framework to /usr/share/dots-hyprland/
  mkdir -p "$pkgdir/usr/share/dots-hyprland"
  cp -r setup sdata "$pkgdir/usr/share/dots-hyprland/"
  chmod +x "$pkgdir/usr/share/dots-hyprland/setup"

  # Install configs to /usr/share/dots-hyprland/dots/ for post_install to deploy
  mkdir -p "$pkgdir/usr/share/dots-hyprland/dots"
  cp -r dots/.config "$pkgdir/usr/share/dots-hyprland/dots/"
  cp -r dots/.local "$pkgdir/usr/share/dots-hyprland/dots/"
}
