# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=hydrapaper
pkgver=3.1.0+1+g290d4e2
pkgrel=1
pkgdesc="A Gtk utility to set different backgrounds for each monitor on GNOME"
arch=('any')
url="https://hydrapaper.gabmus.org"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'dbus-python' 'python-gobject' 'python-pillow')
makedepends=('git' 'gobject-introspection' 'meson' 'pandoc')
checkdepends=('appstream')
_commit=290d4e2ff81afe6d7188643a9daf44fc91d5f316
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
