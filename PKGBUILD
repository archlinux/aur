# Maintainer: Paolo De Donato <dedonato95@hotmail.it>

pkgname=labwc-noxwayland
pkgver=0.8.4
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (without XWayland)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL-2.0-only')
depends=(cairo glibc glib2 libinput libpng librsvg libsfdo libwlroots-0.18.so libxkbcommon libxml2 pango pixman ttf-font wayland hicolor-icon-theme)
makedepends=(git meson scdoc wayland-protocols)
optdepends=("bemenu: default launcher via Alt+F3")
conflicts=(labwc)
provides=(labwc)
source=("git+https://github.com/labwc/labwc#tag=${pkgver}")
b2sums=('ba631a9c5ff6cd1a4178620641dbb8823d20af90cc5b1c705ad0fa70786c6099e95cb04a5b18642aa203964b2bec418e0569b94b1a60543dfd7dbec866c9e0fa')


build() {
  arch-meson -Dman-pages=enabled -Dxwayland=disabled labwc build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
