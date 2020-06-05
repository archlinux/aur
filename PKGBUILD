# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gtk-frdp
pkgver=3.37.1
pkgrel=1
pkgdesc="RDP viewer widget for Gtk"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/gtk-frdp"
license=('LGPL3')
depends=('freerdp' 'gtk3')
makedepends=('git' 'gobject-introspection' 'meson' 'vala')
_commit=3a5f1356864339a5a9af27ce6e9464b8f0c5c5f5  # tags/v3.37.1^0
source=("git+https://gitlab.gnome.org/GNOME/gtk-frdp.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
