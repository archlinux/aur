# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=hydrapaper
pkgver=3.3.1
pkgrel=1
pkgdesc="A Gtk utility to set different backgrounds for each monitor on GNOME"
arch=('any')
url="https://hydrapaper.gabmus.org"
license=('GPL3')
depends=('libadwaita' 'dbus-python' 'python-gobject' 'python-pillow')
makedepends=('blueprint-compiler' 'git' 'gobject-introspection' 'meson' 'pandoc')
checkdepends=('appstream')
_commit=876d292b616f31534292bd036ef23150026483f8
source=("git+https://gitlab.gnome.org/GabMus/HydraPaper.git#commit=$_commit")
#source=("https://gitlab.gnome.org/GabMus/HydraPaper/-/archive/$pkgver/HydraPaper-$pkgver.tar.gz")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/HydraPaper"
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson HydraPaper build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
