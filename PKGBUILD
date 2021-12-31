# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=hydrapaper
pkgver=3.2.0+14+g760e06f
pkgrel=1
pkgdesc="A Gtk utility to set different backgrounds for each monitor on GNOME"
arch=('any')
url="https://hydrapaper.gabmus.org"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'dbus-python' 'python-gobject' 'python-pillow')
makedepends=('blueprint-compiler' 'git' 'gobject-introspection' 'meson' 'pandoc')
checkdepends=('appstream')
_commit=760e06f7cd2910fe70cdd31a736e016a21549c91
source=("git+https://gitlab.gnome.org/GabMus/HydraPaper.git#commit=$_commit")
#source=("https://gitlab.gnome.org/GabMus/HydraPaper/-/archive/$pkgver/HydraPaper-$pkgver.tar.gz")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/HydraPaper"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$srcdir/HydraPaper"
  sed -i 's/1.0.0.alpha.3/1.0.0/g' meson.build
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
