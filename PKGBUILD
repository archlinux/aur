# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=inspector
pkgver=0.2.0
_commit=5e3ac67e7e193bac25dc0cfb8dca7ef982cfcc0e
pkgrel=3
pkgdesc='Gives information about your system'
url="https://github.com/Nokse22/inspector"
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
