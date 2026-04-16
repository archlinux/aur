# Maintainer: weversonl
pkgname=gnome-quick-share
pkgver=1.2.0
pkgrel=1
pkgdesc="Quick Share client for GNOME"
arch=('x86_64')
url="https://github.com/weversonl/gnome-quick-share"
license=('AGPL-3.0-only')
options=(!debug)
depends=(
  'gtk4'
  'gtk3'
  'libadwaita'
  'libayatana-appindicator'
  'glib2'
  'dbus'
)
makedepends=(
  'git'
  'rust'
  'cargo'
  'meson'
  'ninja'
  'gettext'
)
source=("$pkgname::git+https://github.com/weversonl/gnome-quick-share.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  export CARGO_TARGET_DIR="$srcdir/target"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir" meson install -C build
}
