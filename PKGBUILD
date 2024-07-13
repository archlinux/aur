# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fernando Fernández <fernando at softwareperonista dot com dot ar>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Balló György
# Contributor: Artem Vorotnikov <artem at vorotnikov dot me>

pkgname=gxml-git
pkgver=0.20.3.r18.g13c93b4
pkgrel=1
pkgdesc="GObject-based XML parser and writer library"
arch=(x86_64)
url="https://wiki.gnome.org/GXml"
license=(LGPL)
depends=(glib2 libgee libxml2)
makedepends=(git gobject-introspection meson vala)
provides=(gxml)
conflicts=(gxml)
source=("git+https://gitlab.gnome.org/GNOME/gxml.git#branch=gxml-0.20")
sha256sums=('SKIP')

pkgver() {
  git -C gxml describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson gxml build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
