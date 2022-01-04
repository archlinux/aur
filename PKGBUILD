# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.4.0
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/johanmalm/labwc"
arch=('x86_64')
license=('GPL2')
depends=('pango' 'wlroots>=0.15' 'wlroots<0.16' 'wayland' 'wayland-protocols' 'xorg-xwayland')
makedepends=('meson' 'scdoc')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/johanmalm/labwc/archive/${pkgver}.tar.gz")
b2sums=('737636488fdbd273d5ac2f90d63b3924edd257443ca1d857799ec81f1bcf540819e9d9b0cc06e1eb18a8db1f7c524c54606998aedeec3789529df73779062844')


build() {
  cd "$pkgname-$pkgver"
  arch-meson -Dman-pages=enabled ../build
  ninja -v -C ../build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="${pkgdir}" meson install -C ../build
}
