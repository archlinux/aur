# Maintainer: Hiroaki Yamamoto <hrak1529@gmail.com>

# Based on labwc AUR from Lex Black <autumn-wind@web.de>

pkgname=labwc-im
pkgver=0.20.0
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (with text-input-v1 support)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('libpng' 'librsvg' 'libsfdo' 'pango' 'seatd' 'libwlroots-0.20.so' 'wayland' 'xorg-xwayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
conflicts=(labwc)
provides=(labwc)
source=(labwc-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz"
        '0001-IME-support-text-input-v1.patch')
b2sums=('09a7d5bc1b775d370cfc294a76a679aac441f3bf5518bd5e271c398ecf64ca506e2096a625f467e34252668310852113d07d84e6d1caaf76f800271ea6f8094a'
        '1ba02b3359e3497d478f28457d8e5556852f2dc2f6989c4c74425d245b09291f74097456a002d821a8b86078e53d633ebc199b3fe6d9612ca6819f8da9aa2ae1')

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
