# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Mark Wagie (yochananmarqos) <mark.wagie@proton.me>

pkgname=libgedit-gtksourceview-git
pkgver=299.3.0.r12.gf685515
pkgrel=1
pkgdesc="A library that extends GtkTextView, the standard GTK widget for multiline text editing"
arch=(x86_64)
url="libgedit-gtksourceview"
license=(LGPL-2.1-or-later)
depends=(gtk3 libxml2)
makedepends=(git gobject-introspection gtk-doc meson glib2-devel)
checkdepends=(xorg-server-xvfb)
provides=(libgedit-gtksourceview libgedit-gtksourceview-300.so)
conflicts=(libgedit-gtksourceview)
source=("git+https://gitlab.gnome.org/World/gedit/libgedit-gtksourceview.git")
sha256sums=('SKIP')

pkgver() {
  cd "libgedit-gtksourceview"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "libgedit-gtksourceview" build
  meson compile -C build
}

check() {
  #export NO_AT_BRIDGE=1
  xvfb-run -s '-screen 0 1920x1080x24 -nolisten local' meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
