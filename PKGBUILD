# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Michael Kanis <mkanis@gmx.de>

pkgname=libchamplain
pkgver=0.12.20
pkgrel=3
pkgdesc="A map widget"
url="https://wiki.gnome.org/Projects/libchamplain"
license=(LGPL)
arch=(x86_64)
depends=(clutter-gtk libsoup cairo sqlite)
makedepends=(gobject-introspection gtk-doc vala meson git)
_commit=145e417f32e507b63c21ad4e915b808a6174099e  # tags/LIBCHAMPLAIN_0_12_20^0
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
