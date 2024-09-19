# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=trivia-quiz
pkgver=1.0.1
_commit=192ca631bdfdf1519565c2c8a6587e24c6f4b1da
pkgrel=1
pkgdesc='Respond to endless questions'
url="https://github.com/Nokse22/trivia-quiz"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('libadwaita' 'python-gobject' 'python-requests')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
