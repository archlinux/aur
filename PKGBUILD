# Maintainer: Hiroaki Yamamoto <hrak1529@gmail.com>

# Based on labwc AUR from Lex Black <autumn-wind@web.de>

pkgname=labwc-im
pkgver=0.7.2
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (with IME, IME popups and minimal text-input-v1 support)'
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
b2sums=('68d47d316f5dd19252db4ea11c313a9f8da560b25ff16623ee63f8ce88eccbea779e6a9f37bbf343a4926afecf40e3c9b1038833a171fe4acd90cf8b6b9035c0'
        '574c56a3518dfd2aef5efa7cbb1b00a2c4bbaa6697a25a39127d5505a33b7c3baed9cb77b1556df1fd448b556be0c088fe145beec690d9446d781c19de8c76ed')

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
