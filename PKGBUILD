# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=tags
pkgver=1.2
_commit=93e8a5b42a16eea8e3034b823a8b977b57865c64
pkgrel=1
pkgdesc='A simple text tagger'
url="https://github.com/phastmike/tags"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('json-glib' 'libadwaita')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson tags build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 tags/COPYING -t "$pkgdir/usr/share/licenses/tags"
}
