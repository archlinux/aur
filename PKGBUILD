# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.7.3
pkgrel=2
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'libwlroots.so=12-64' 'wayland' 'xorg-xwayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
b2sums=('e8e42175e7b1b298b36f91b656704bee0070abc3b933b7c98d1d0f96f84f70100b45fb1c5fc0fc2c0d9fb303155f3a4f0658e1cd818946fd71d86c13010ea753')


build() {
  export PKG_CONFIG_PATH='/usr/lib/wlroots0.17/pkgconfig'
  arch-meson -Dman-pages=enabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
