# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=tags
pkgver=1.1
pkgrel=1
pkgdesc='A simple text tagger'
url="https://github.com/phastmike/tags"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('json-glib' 'libadwaita')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 $pkgname/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
