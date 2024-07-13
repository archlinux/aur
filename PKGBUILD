# Maintainer: Hiroaki Yamamoto <hrak1529@gmail.com>

# Based on labwc AUR from Lex Black <autumn-wind@web.de>

pkgname=labwc-im
pkgver=0.7.3
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (with text-input-v1 support)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'wlroots>=0.17' 'wlroots<0.18' 'wayland' 'xorg-xwayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
conflicts=(labwc)
provides=(labwc)
source=(labwc-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz"
        '0001-IME-support-text-input-v1.patch')
b2sums=('e8e42175e7b1b298b36f91b656704bee0070abc3b933b7c98d1d0f96f84f70100b45fb1c5fc0fc2c0d9fb303155f3a4f0658e1cd818946fd71d86c13010ea753'
        '65708bcfa6341643bc261a643f00143cab648b1ec7117219757bb3316e5ae761a6232007b560def56989e0b75684e78a39b99da677af22eaf8922843dc6ffc9d')

prepare() {
  cd "labwc-$pkgver"
  patch -Np1 -i ../0001-IME-support-text-input-v1.patch
}

build() {
  arch-meson -Dman-pages=enabled "labwc-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
