# Maintainer: Hiroaki Yamamoto <hrak1529@gmail.com>

# Based on labwc AUR from Lex Black <autumn-wind@web.de>

pkgname=labwc-im
pkgver=0.7.4
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (with text-input-v1 support)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'libwlroots.so=12-64' 'wayland' 'xorg-xwayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
conflicts=(labwc)
provides=(labwc)
source=(labwc-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz"
        '0001-IME-support-text-input-v1.patch')
b2sums=('8aa259682ff6b937f02e50b0a61385e2fd48e43692123efdfc6a8ab7868f8168337d087d62387d8da03c5a0e0594163a11147056f61ef86ec83d8fd9c896a356'
        '65708bcfa6341643bc261a643f00143cab648b1ec7117219757bb3316e5ae761a6232007b560def56989e0b75684e78a39b99da677af22eaf8922843dc6ffc9d')

prepare() {
  cd "labwc-$pkgver"
  patch -Np1 -i ../0001-IME-support-text-input-v1.patch
}

build() {
  export PKG_CONFIG_PATH='/usr/lib/wlroots0.17/pkgconfig'
  arch-meson -Dman-pages=enabled "labwc-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
