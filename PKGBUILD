# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gabtag
pkgver=7
pkgrel=1
pkgdesc="A Gtk Linux application to handle audio tags"
arch=('any')
url="https://github.com/lachhebo/GabTag"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python-cairo' 'python-gobject' 'python-musicbrainzngs'
         'python-mutagen' 'python-pillow')
makedepends=('meson')
checkdepends=('appstream-glib' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2299701ea6d7c2e266dccd80e76e229c875e7d6b2338531864f3ebf2b86a2457')

build() {
  arch-meson "GabTag-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs

  cd "GabTag-$pkgver"
  pytest tests
}

package() {
  meson install -C build --destdir "$pkgdir"
}
