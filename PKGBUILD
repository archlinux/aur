# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=teleprompter
pkgver=1.0.1
_commit=bbd36400d131fd934704282b8892a3387ff2d784
pkgrel=1
pkgdesc='Stay on track during speeches'
url="https://github.com/Nokse22/teleprompter"
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
