# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=tags
pkgver=2.5
pkgrel=1
pkgdesc='A simple text tagger'
url="https://github.com/phastmike/tags"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('json-glib' 'libadwaita')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('06a260420a6fc6329c3a1a50107a61b3c9017cb2d02ff855c908c98367824407')

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
