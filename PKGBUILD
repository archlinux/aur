# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.3.0
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/johanmalm/labwc"
arch=('x86_64')
license=('GPL2')
depends=('pango' 'wlroots>=0.14' 'wlroots<0.15' 'wayland' 'wayland-protocols' 'xorg-xwayland')
makedepends=('meson' 'scdoc')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/johanmalm/labwc/archive/${pkgver}.tar.gz")
b2sums=('8afe1641cf49f922f7cdc027c4510f76e958177031708c8ecd7406e3630576262203dfabb32bea502214d8504f1a36b62e2896f94780a2672c1b3fb56b91fa47')


build() {
  cd "$pkgname-$pkgver"
  arch-meson -Dman-pages=enabled ../build
  ninja -v -C ../build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="${pkgdir}" meson install -C ../build
}
