# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.6.0
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('pango' 'wayland' 'xorg-xwayland') # 'wlroots>=0.16' 'wlroots<0.17'
makedepends=('meson' 'scdoc' 'wayland-protocols')
makedepends+=('vulkan-headers' 'xorgproto') # for latest compatible wlroots
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
b2sums=('f3d51f6d0e04b2aee199d692b5327339237813021a84c9fb7530a4b30ba2d4eb837c260c1ba402c9c1c6adf4990ec8116f9b9f61266261e655f6b9582c079c68')


prepare() {
  meson subprojects download wlroots --sourcedir="$pkgname-$pkgver"
}

build() {
  arch-meson -Dman-pages=enabled "$pkgname-$pkgver" build --force-fallback-for=wlroots
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
