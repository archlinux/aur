# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=mini-text
pkgver=1.0.0
_commit=3634e6c705a052c509834e0de3450c3ff9792be2
pkgrel=1
pkgdesc='A very small and basic text editor'
url="https://github.com/Nokse22/mini-text"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('libadwaita' 'python-gobject')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
