# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gabtag
pkgver=8
pkgrel=1
pkgdesc="A Gtk Linux application to handle audio tags"
arch=('any')
url="https://github.com/lachhebo/GabTag"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python-cairo' 'python-gobject' 'python-musicbrainzngs'
         'python-mutagen' 'python-pillow')
makedepends=('meson')
#checkdepends=('appstream-glib' 'python-pytest')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5a6f5f7cf191e5f7c9a574e9afa5bc744f6fca0d3638708ffbb99ff8bd962d0b')

build() {
  arch-meson "GabTag-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs

  cd "GabTag-$pkgver"
#  pytest tests
}

package() {
  meson install -C build --destdir "$pkgdir"
}
