# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=hydrapaper
pkgver=3.3.2
pkgrel=2
pkgdesc="A Gtk utility to set different backgrounds for each monitor on GNOME"
arch=('any')
url="https://hydrapaper.gabmus.org"
license=('GPL-3.0-or-later')
depends=(
  'libadwaita'
  'python-dbus'
  'python-gobject'
  'python-pillow'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'gobject-introspection'
  'meson'
  'pandoc'
)
source=("git+https://gitlab.gnome.org/GabMus/HydraPaper.git#tag=$pkgver")
sha256sums=('979949d75d89618b26ca765a5c2b6273506087e1b7b00db2a51a53cacca709fe')

build() {
  arch-meson HydraPaper build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
