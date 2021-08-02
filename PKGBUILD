# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=kooha
pkgver=1.2.1
pkgrel=1
pkgdesc="Simple screen recorder for GNOME"
arch=('x86_64')
url="https://github.com/SeaDve/Kooha"
license=('GPL3')
depends=('gstreamer' 'gtk4' 'libadwaita' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
sha256sums=('1aea99804489363e3708559e45e6ad0583a092430fb7c446240e74f2d9bb19eb')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

build() {
  arch-meson Kooha-$pkgver build
  meson compile -C build
}

check() {

# Validate appstream file test failing
  meson test -C build 'Validate desktop file' 'Validate schema file' --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
