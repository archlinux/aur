# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=python38-gobject
pkgver=3.36.1
pkgrel=5
pkgdesc="Python 3.8 Bindings for GLib/GObject/GIO/GTK+"
url="https://wiki.gnome.org/Projects/PyGObject"
arch=(x86_64)
license=(LGPL)
depends=(gobject-introspection-runtime python38)
makedepends=(python38-cairo gobject-introspection git meson)
optdepends=('cairo: Cairo bindings')
_commit=5c6bee1c2a0d08cf367aa61784b5b967128e68b2  # tags/3.36.1^0
source=("git+https://gitlab.gnome.org/GNOME/pygobject.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson pygobject build -D python=/usr/bin/python3.8
  meson compile -C build
}

package_python38-gobject() {
  DESTDIR="$pkgdir" meson install -C build
  python3.8 -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python3.8 -O -m compileall -d /usr/lib "$pkgdir/usr/lib"

  # Remove devel stuff conflicting with python-gobject
  rm -r "$pkgdir"/usr/{include,lib/pkgconfig}
}