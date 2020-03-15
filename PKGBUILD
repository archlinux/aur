# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=gala-git
pkgver=3.2.0.r73.c49189b
pkgrel=1
pkgdesc='The Pantheon Window Manager'
arch=(x86_64)
url=https://github.com/elementary/gala
license=(GPL3)
groups=(pantheon-unstable)
depends=(
  atk
  bamf
  cairo
  gdk-pixbuf2
  glib2
  gnome-desktop
  gtk3
  json-glib
  libdrm
  libgee
  libgl
  libgranite.so
  libx11
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxi
  libxrandr
  libxtst
  mesa
  mutter
  pango
  plank
  wayland
)
makedepends=(
  git
  gnome-common
  granite
  intltool
  meson
  vala
)
provides=(
  gala
  libgala.so
)
conflicts=(gala)
source=(git+https://github.com/elementary/gala.git)
sha256sums=(SKIP)

pkgver() {
  cd gala

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  arch-meson gala build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
