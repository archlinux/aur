# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Michael Kanis <mkanis@gmx.de>

pkgname=libchamplain
pkgver=0.12.22
pkgrel=1
pkgdesc="Map widget for GTK 3"
url="https://wiki.gnome.org/Projects/libchamplain"
license=(LGPL)
arch=(x86_64)
depends=(clutter-gtk libsoup3 cairo sqlite)
makedepends=(glib2-devel gobject-introspection gtk-doc vala meson git)
_commit=ad9de2896b8a2b0e91e6a9e3da86af9c961f000a  # HEAD, version bumped at 84ce376d81f1316c9796bf84a6ded7a767c4c361
source=("git+https://gitlab.gnome.org/GNOME/libchamplain.git#commit=$_commit")
sha256sums=('60ff41c1c602e8eff71ae5348c01ccfc574cc4a178ca5ffd7e850460de7ff6a3')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^LIBCHAMPLAIN_//;s/_/./g;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build -D gtk_doc=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
