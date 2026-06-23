# Maintainer: Twilight0 <twilight0@vivaldi.net>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: Ner0

pkgname=nemo-filechooser
pkgver=6.7.3
pkgrel=1
pkgdesc='File manager for Cinnamon (Nautilus fork) - with native file chooser D-Bus portal integration'
arch=(x86_64)
url='https://github.com/linuxmint/nemo'
license=('GPL-3.0-or-later AND LGPL-2.1-or-later')
depends=(
  at-spi2-core
  bash
  cairo
  cinnamon-desktop
  dconf
  exempi
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  gvfs
  hicolor-icon-theme
  json-glib
  libexif
  libx11
  libxmlb
  pango
  python
  python-cairo
  python-gobject
  xapp
)
optdepends=(
  'catdoc: search helpers support for legacy MS Word files'
  'cinnamon-translations: i18n'
  'ffmpegthumbnailer: support for video thumbnails'
  'ghostscript: search helpers support for PostScript files'
  'libgsf: search helpers support for MS Office files'
  'libreoffice: search helpers support for legacy MS PowerPoint files'
  'poppler: search helpers support for PDF files'
  'python-xlrd: search helpers support for legacy MS Excel files'
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  intltool
  libgsf
  meson
)
provides=(nemo)
conflicts=(nemo)
source=("nemo::git+https://github.com/Twilight0/nemo.git#branch=feature/native-file-picker")
sha256sums=('SKIP')

pkgver() {
  cd nemo
  printf "6.7.3.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson nemo build \
    --libexecdir=lib/nemo \
    -D gtk_doc=true
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
