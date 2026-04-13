# Maintainer: Sam Saffron <sam.saffron@gmail.com>
pkgname=hyprland-share-picker-preview-git
pkgver=1.3.11
pkgrel=1
pkgdesc="Custom hyprland share picker with improved UI (window previews, workspace sorting)"
arch=('x86_64')
url="https://github.com/SamSaffron/xdg-desktop-portal-hyprland"
license=('BSD-3-Clause')
depends=('qt6-base' 'hyprutils' 'wayland')
makedepends=('meson' 'ninja' 'hyprwayland-scanner' 'wayland-protocols' 'hyprland-protocols'
             'libpipewire' 'sdbus-cpp' 'hyprlang' 'libdrm' 'mesa')
source=("git+https://github.com/SamSaffron/xdg-desktop-portal-hyprland.git#branch=better-picker")
sha256sums=('SKIP')

pkgver() {
  cd xdg-desktop-portal-hyprland
  cat VERSION | tr -d '\n'
}

build() {
  cd xdg-desktop-portal-hyprland
  meson setup build --prefix=/usr/local
  meson compile -C build hyprland-share-picker/hyprland-share-picker
}

package() {
  cd xdg-desktop-portal-hyprland
  install -Dm755 build/hyprland-share-picker/hyprland-share-picker \
    "$pkgdir/usr/local/bin/hyprland-share-picker"
}
