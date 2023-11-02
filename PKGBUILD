# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Ícar N. S. <icar dot nin at pm dot me>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=setzer-git
pkgver=61.r9.gf278b48
pkgrel=2
pkgdesc="LaTeX editor written in Python with Gtk"
arch=(any)
url="https://www.cvfosammmm.org/setzer/"
license=(GPL3)
depends=(gspell gtk4 gtksourceview5 poppler-glib python-cairo
         python-gobject python-pdfminer python-pyxdg texlive-basic
         webkitgtk-6.0 xdg-utils libhandy python-bibtexparser

         # namcap implicit depends
         pango python gobject-introspection-runtime graphene gdk-pixbuf2)
makedepends=(appstream git meson)
provides=(setzer)
conflicts=(setzer)
source=("git+https://github.com/cvfosammmm/Setzer.git")
sha256sums=('SKIP')

pkgver() {
  cd Setzer
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson Setzer build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
