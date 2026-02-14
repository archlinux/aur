# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=clutter-gtk
pkgver=1.8.4
pkgrel=5
pkgdesc='Clutter integration with GTK+'
#url=https://blogs.gnome.org/clutter
url=https://gitlab.gnome.org/Archive/clutter-gtk
arch=(x86_64)
license=(LGPL-2.1)
depends=(clutter)
makedepends=(git gobject-introspection gtk-doc meson)
_commit=77483ba46384adde76f6c4599eae77eeec852c56 # tags/1.8.4^0
source=("$pkgname-$pkgver::git+$url.git#commit=$_commit")
sha256sums=('31f1beba9da45d87c602e3241a630f6131bb3c7f9a8dc5d8af442271305b9013')

pkgver() {
  git -C $pkgname-$pkgver describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  arch-meson $pkgname-$pkgver build -Denable_docs=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 et:
