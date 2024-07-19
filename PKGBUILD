# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.7.4
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'libwlroots.so=12-64' 'wayland' 'xorg-xwayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
b2sums=('8aa259682ff6b937f02e50b0a61385e2fd48e43692123efdfc6a8ab7868f8168337d087d62387d8da03c5a0e0594163a11147056f61ef86ec83d8fd9c896a356')


build() {
  export PKG_CONFIG_PATH='/usr/lib/wlroots0.17/pkgconfig'
  arch-meson -Dman-pages=enabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
