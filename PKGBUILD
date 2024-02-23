# Maintainer: Hiroaki Yamamoto <hrak1529@gmail.com>

# Based on labwc AUR from Lex Black <autumn-wind@web.de>

pkgname=labwc-im
pkgver=0.7.0
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
b2sums=('18ab44981eb4c8f949707243422feebe4292e7ac8b7cada8d309af12fad55bfc742f5ad0600f1f77dfdc83497f5dd0c546363f5b711460b1a11197ce2e13e5ca'
        '16d73f7715e266f123c83d0297aa78cb3bbc31e7c97408f3427cdd6b40139ce7b9b2d99c6f64c046122e9fd9220381786bd57dc0c7bb9dc826848cd757c0a9a2')

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
