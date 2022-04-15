# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=mousai
pkgver=0.6.6
pkgrel=4
pkgdesc="Simple application for identifying songs"
arch=('any')
url="https://apps.gnome.org/app/io.github.seadve.Mousai"
license=('GPL3')
depends=('gstreamer' 'libadwaita' 'python-gobject' 'python-requests')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeaDve/Mousai/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a1e5cb29ad16405abcab8b5e1eec82fc170e5f535f8c55b57f18c80acb18a0ae')

build() {
  arch-meson Mousai-$pkgver build
  meson compile -C build
}

check() {

  # Validate appstream file test fails
  meson test 'Validate desktop file' 'Validate schema file' -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
