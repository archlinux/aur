# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=hydrapaper
pkgver=3.3.2
pkgrel=1
pkgdesc="A Gtk utility to set different backgrounds for each monitor on GNOME"
arch=('any')
url="https://hydrapaper.gabmus.org"
license=('GPL3')
depends=('libadwaita' 'dbus-python' 'python-gobject' 'python-pillow')
makedepends=('blueprint-compiler' 'git' 'gobject-introspection' 'meson' 'pandoc')
checkdepends=('appstream')
_commit=4589088da390362906ac9fecb8d4b26f594656d9  # tags/3.3.2^0
source=("git+https://gitlab.gnome.org/GabMus/HydraPaper.git#commit=$_commit")
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
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
