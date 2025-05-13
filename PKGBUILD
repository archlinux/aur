# Maintainer: Paolo De Donato <dedonato95@hotmail.it>

pkgname=labwc-noxwayland-git
pkgver=0.8.4.r11.g3bd5964
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
source=("git+https://github.com/labwc/labwc.git")
b2sums=('SKIP')

pkgver() {
  cd labwc
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
  arch-meson -Dman-pages=enabled -Dxwayland=disabled labwc build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
