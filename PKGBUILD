# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=inspector
pkgver=0.1.9
_commit=e1ed9bfd2666852e638a92034a3c0357e2c44393
pkgrel=1
pkgdesc='Gives information about your system'
url="https://github.com/Nokse22/inspector"
license=('GPL-3.0-or-later')
arch=('aarch64' 'x86_64')
depends=('libadwaita' 'python')
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
