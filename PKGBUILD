# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.6.6
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'wlroots0.16' 'wayland' 'xorg-xwayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
b2sums=('646946b53a5261d8683f9f983f9d86eb2552db50d2fb4215c8e32377f0ab38c1a37d0a7e14fbdc32a5d9015d1d6fce184eaeaf5614c1f9a5351a091156b896ff')


build() {
  export PKG_CONFIG_PATH='/usr/lib/wlroots0.16/pkgconfig'
  arch-meson -Dman-pages=enabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
