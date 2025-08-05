# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=tags
pkgver=1.3
pkgrel=1
pkgdesc='A simple text tagger'
url="https://github.com/phastmike/tags"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('json-glib' 'libadwaita')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a218e40998964c1a57bd1755851c8c7d2c664e64777c25ef7e1cde3b3789c509')

build() {
  arch-meson tags-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 tags-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/tags"
}
