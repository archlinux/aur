# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.5.0
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('pango' 'wlroots>=0.15' 'wlroots<0.16' 'wayland' 'wayland-protocols' 'xorg-xwayland')
makedepends=('meson' 'scdoc')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
b2sums=('bb7008b60e180fa9f936cb2a09e4ce616e70c2238dceb32e29f4cd8396a2ca2f0f58b43240afd9f4ed95cc371155ee154c20a261f6fbeb3321846870631d7d47')


build() {
  cd "$pkgname-$pkgver"
  arch-meson -Dman-pages=enabled ../build
  ninja -v -C ../build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="${pkgdir}" meson install -C ../build
}
