# Maintainer: Daniel Grasso

pkgname=wayland-scroll-factor
pkgver=0.3.2
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
sha256sums=('d6c84957f371a2a5ec4c393661fab538d2f1328ee95cb0950e3f4732f039e48f')

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
