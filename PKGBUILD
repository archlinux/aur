# Maintainer: Twilight0 <twilight0@vivaldi.net>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: Ner0

pkgbase=nemo-filechooser
pkgname=dory
pkgver=6.7.3.r2603.682e738
pkgrel=1
pkgdesc='Cinnamon File Chooser Portal Helper (Nemo fork) - side-by-side native picker'
arch=(x86_64)
url='https://github.com/Twilight0/nemo'
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
  nemo
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  libgsf
  meson
)
source=("dory::git+https://github.com/Twilight0/nemo.git#branch=feature/dory-file-picker")
sha256sums=('SKIP')

pkgver() {
  cd dory
  printf "6.7.3.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson dory build \
    --libexecdir=lib/dory \
    -D gtk_doc=false
  meson compile -C build
}

package_dory() {
  meson install -C build --destdir="$pkgdir"

  # Clean up all files that conflict with the official nemo package
  rm -f "$pkgdir/usr/bin/nemo-desktop"
  rm -f "$pkgdir/usr/bin/nemo-autorun-software"
  rm -f "$pkgdir/usr/bin/nemo-connect-server"
  rm -f "$pkgdir/usr/bin/nemo-open-with"
  rm -f "$pkgdir/usr/bin/nemo-xls-to-txt"
  rm -f "$pkgdir/usr/bin/nemo-odf-to-txt"
  rm -f "$pkgdir/usr/bin/nemo-epub2text"
  rm -f "$pkgdir/usr/bin/nemo-action-layout-editor"
  rm -f "$pkgdir/usr/bin/nemo-mso-to-txt"
  rm -f "$pkgdir/usr/bin/nemo-ppt-to-txt"
  rm -f "$pkgdir/usr/share/dbus-1/services/nemo.FileManager1.service"
  rm -f "$pkgdir/usr/share/dbus-1/services/nemo.service"
  rm -rf "$pkgdir/usr/lib/dory"
  rm -rf "$pkgdir/usr/share/applications"
  rm -rf "$pkgdir/usr/share/icons"
  rm -rf "$pkgdir/usr/share/polkit-1"
  rm -rf "$pkgdir/usr/share/nemo"
  rm -f "$pkgdir/usr/lib/libnemo-extension.so"*
  rm -rf "$pkgdir/usr/lib/girepository-1.0"
  rm -rf "$pkgdir/usr/share/gir-1.0"
  rm -rf "$pkgdir/usr/share/glib-2.0/schemas"
  rm -rf "$pkgdir/usr/include"
  rm -f "$pkgdir/usr/lib/pkgconfig/libnemo-extension.pc"
  rm -rf "$pkgdir/usr/share/gtksourceview-"*
  rm -rf "$pkgdir/usr/share/man"
  rm -rf "$pkgdir/usr/share/mime"
}
