# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Michael Kanis <mkanis@gmx.de>

pkgname=libchamplain
pkgver=0.12.19
pkgrel=1
pkgdesc="A map widget"
url="https://wiki.gnome.org/Projects/libchamplain"
license=(LGPL)
arch=(x86_64)
depends=(clutter-gtk libsoup cairo sqlite)
makedepends=(gobject-introspection gtk-doc vala meson git)
_commit=37493068c81f28773a910ab3a781fe83fd8fb6f3  # tags/LIBCHAMPLAIN_0_12_19^0
source=("git+https://gitlab.gnome.org/GNOME/libchamplain.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^LIBCHAMPLAIN_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build -D gtk_doc=true
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
