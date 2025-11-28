# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gabtag
pkgver=15
pkgrel=1
pkgdesc="A Gtk Linux application to handle audio tags"
arch=('any')
url="https://github.com/lachhebo/GabTag"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'python-cairo'
  'python-gobject'
  'python-musicbrainzngs'
  'python-mutagen'
  'python-pillow'
)
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b32a187a42e53a771469865d4e5aa28da36c3b00224f887073c8fea454b13476')

prepare() {
  cd "GabTag-$pkgver"
}

build() {
  arch-meson "GabTag-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
