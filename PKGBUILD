# $Id$
# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>
# Contributor: Mauro Fruet <maurofruet@gmail.com>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=evince-git
pkgver=46.1+278+g7b8dbf09
pkgrel=1
pkgdesc="Document viewer (PDF, PostScript, XPS, djvu, dvi, tiff, cbr, cbz, cb7, cbt)"
url="http://projects.gnome.org/evince/"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  at-spi2-core
  cairo
  dconf
  djvulibre
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gnome-desktop
  gsettings-desktop-schemas
  gsfonts
  gspell
  gst-plugins-base-libs
  gstreamer
  gtk3
  gvfs
  hicolor-icon-theme
  libarchive
  libgxps
  libhandy
  libsecret
  libspectre
  libsynctex
  libtiff
  libxml2
  pango
  poppler-glib
)
makedepends=(
  appstream-glib
  gi-docgen
  git
  glib2-devel
  gobject-introspection
  meson
  texlive-bin
  yelp-tools
)
optdepends=('texlive-bin: DVI support')
provides=(evince libev{document,view}3.so)
conflicts=(evince)
options=('!emptydirs')
source=($pkgname::"git+https://gitlab.gnome.org/GNOME/evince.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/-/+/g'
}

build() {
  local meson_options=(
    -D ps=enabled
  )
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
