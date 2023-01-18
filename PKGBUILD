# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Michael Kanis <mkanis@gmx.de>

pkgname=libchamplain
pkgver=0.12.21
pkgrel=1
pkgdesc="Map widget for GTK 3"
url="https://wiki.gnome.org/Projects/libchamplain"
license=(LGPL)
arch=(x86_64)
depends=(clutter-gtk libsoup3 cairo sqlite)
makedepends=(gobject-introspection gtk-doc vala meson git)
_commit=941560af497148588783db991e8135f52a82574d  # tags/0.12.21^0
source=("git+https://gitlab.gnome.org/GNOME/libchamplain.git#commit=$_commit")
sha256sums=('SKIP')

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
