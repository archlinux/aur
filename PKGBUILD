# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.7.0
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'wlroots>=0.17' 'wlroots<0.18' 'wayland' 'xorg-xwayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
b2sums=('18ab44981eb4c8f949707243422feebe4292e7ac8b7cada8d309af12fad55bfc742f5ad0600f1f77dfdc83497f5dd0c546363f5b711460b1a11197ce2e13e5ca')


build() {
  export PKG_CONFIG_PATH='/usr/lib/wlroots0.16/pkgconfig'
  arch-meson -Dman-pages=enabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
