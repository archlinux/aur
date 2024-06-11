# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=mini-text
pkgver=0.2.2
_commit=9661c16c274d1c46ed1c0990f12614414ffd24dd
pkgrel=3
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
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
