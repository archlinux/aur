# Maintainer: Daniel Grasso

pkgname=wayland-scroll-factor
pkgver=0.3.5
pkgrel=1
pkgdesc='Touchpad scroll and gesture tuning for Wayland (GNOME and Hyprland)'
arch=('x86_64')
url='https://github.com/daniel-g-carrasco/wayland-scroll-factor'
license=('MIT')
options=('!debug')
depends=('gtk4' 'libadwaita' 'python' 'python-gobject')
makedepends=('meson' 'ninja' 'pkgconf' 'gcc')
optdepends=(
  'libinput-tools: for wsf doctor diagnostics'
  'hyprland: for Hyprland native scroll and gesture support'
)
install=wayland-scroll-factor.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/daniel-g-carrasco/wayland-scroll-factor/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('59d49cf6e1ebbb5434db0c8f629e50830d33d09a6e6280458b9187f722f7f983')

build() {
  cd "$pkgname-$pkgver"
  meson setup build --prefix=/usr --buildtype=release
  ninja -C build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
