# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: sh4nks <sh4nks7@gmail.com

pkgname=lightdm-pantheon-greeter
pkgver=3.3.1
pkgrel=1
pkgdesc='Pantheon greeter for LightDM'
arch=(x86_64)
url=https://github.com/elementary/greeter
license=(GPL)
groups=(pantheon)
depends=(
  cairo
  clutter-gtk
  gdk-pixbuf2
  glib2
  gtk3
  libmutter2
  libgee
  libgl
  libgranite.so
  libx11
  lightdm
)
makedepends=(
  meson
  git
  libglvnd
  libxfixes
  vala
)
install=lightdm-pantheon-greeter.install
source=(lightdm-pantheon-greeter::git+https://github.com/elementary/greeter.git#tag=${pkgver})
sha256sums=(SKIP)

pkgver() {
  cd lightdm-pantheon-greeter

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  arch-meson lightdm-pantheon-greeter build \
    -D b_pie=false \
    -D ubuntu-patched-gsd=false
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}

# vim: ts=2 sw=2 et:
