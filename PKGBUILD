# Maintainer: Moabeat <moabeat@berlin.de>

pkgname=pwvucontrol
pkgver=0.4.8
pkgrel=1
pkgdesc="Pipewire volume control for GNOME"
url="https://github.com/saivert/pwvucontrol"
arch=(x86_64)
license=(GPL-3.0-only)

depends=(glib2 gtk4 libadwaita wireplumber libwireplumber-4.0-compat)
makedepends=(rust clang meson cmake git)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")

b2sums=('12854fc67c3e7d25e8552e8470e36116986da27d66838283ca07791ad1a0a1d9b8d4da38d3425c8a1643e5a76b4620730538a42f2b0d01dfcbab4f5a6a5662f4')

build() {
  arch-meson --reconfigure $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
