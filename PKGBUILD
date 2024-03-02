# Maintainer: Hiroaki Yamamoto <hrak1529@gmail.com>

# Based on labwc AUR from Lex Black <autumn-wind@web.de>

pkgname=labwc-im
pkgver=0.7.1
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
        'ime-popup-text-input-v1.patch')
b2sums=('55e5539953edaccbb8b3c991b7cbc362c1783c0eb49ba92f3b135b95f2462226073d61a4122171662f63419b21141088da9a742a9b320e55e868fb6e2049d00a'
        '997f5d03e9e82178b47415a480bdf1ac171b6ccaf9e8c582b77c03bfa1b5fe1cace4b5515f9ae88e4fe062c0e35ed525cfc4495f8226a866ba439ab1fdf8a19f')

prepare() {
  cd "labwc-$pkgver"
  patch -Np1 -i ../ime-popup-text-input-v1.patch
}

build() {
  arch-meson -Dman-pages=enabled "labwc-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
