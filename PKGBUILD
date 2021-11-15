# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=hydrapaper
pkgver=3.2.0
pkgrel=1
pkgdesc="A Gtk utility to set different backgrounds for each monitor on GNOME"
arch=('any')
url="https://hydrapaper.gabmus.org"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'dbus-python' 'python-gobject' 'python-pillow')
makedepends=('git' 'gobject-introspection' 'meson' 'pandoc')
checkdepends=('appstream')
#_commit=593f6946c36339ac8c4d0703637185c2a96fe252
#source=("git+https://gitlab.gnome.org/GabMus/HydraPaper.git#commit=$_commit")
source=("https://gitlab.gnome.org/GabMus/HydraPaper/-/archive/$pkgver/HydraPaper-$pkgver.tar.gz")
sha256sums=('d3340e3c9d2db0055c36848329742be6e77ceddc9d425ce32b79ab7d1813044f')

#pkgver() {
#  cd "$srcdir/HydraPaper"
#  git describe --tags | sed 's/-/+/g'
#}

build() {
  arch-meson HydraPaper-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
