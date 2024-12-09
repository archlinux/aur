# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Tobias Bohrmann (PlainTextField) <honeypot.carbage@aechelon.de>
# Contributor: Bernd Prünster (JesusMcCloud) <aur@berndpruenster.org>

pkgname=enter-tex
pkgver=3.47.0
pkgrel=2
pkgdesc='TeX/LaTeX text editor'
arch=('x86_64')
url='https://gitlab.gnome.org/swilmet/enter-tex'
license=('GPL-3.0-or-later')
depends=(
  dconf
  gdk-pixbuf2
  glib2
  glibc
  gsettings-desktop-schemas
  gspell
  gtk3
  hicolor-icon-theme
  libgedit-amtk
  libgedit-gtksourceview 
  libgedit-tepl
  libgee
  pango
)
makedepends=(
  appstream-glib
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
  vala
  yelp-tools
)
optdepends=('texlive-latex: build LaTeX documents')
provides=('gnome-latex')
conflicts=('gnome-latex')
replaces=('gnome-latex')
source=("git+https://gitlab.gnome.org/swilmet/enter-tex.git#tag=$pkgver")
b2sums=('0f50e29d4ef3fff84f05f76248629a8eddc3f498078299e91aacfbd141e0991ffc8c4bcd9a5947cfb046e3305111714bc5b0b16830342ded1cf8c7ef054e1432')

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  ninja src/gtex/Gtex-1.gir -C build
  ninja -C build
}

check() (
  meson test -C build --print-errorlogs
)

package() {
  meson install -C build --destdir "$pkgdir"
}
