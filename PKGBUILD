# Maintainer: Daniel Grasso

pkgname=wayland-scroll-factor
pkgver=0.3.0
pkgrel=2
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
sha256sums=('37cf91fa9eda3c9d8e3c4b6a9c15ac22c0429a4a66a55cee29be963d45389cb8')

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
