# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=wike
pkgver=1.5.4
pkgrel=1
pkgdesc="Wikipedia Reader for the GNOME Desktop"
arch=('x86_64')
url="https://github.com/hugolabe/Wike"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python-gobject' 'python-requests' 'webkit2gtk')
makedepends=('meson')
#checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e5dbc2aef5eb4c8398210d210d07c5e3f0cf91f0e0bf897793f2435c935e5686')

build() {
  arch-meson Wike-$pkgver build
  meson compile -C build
}

check() {

  # Validate appstream file fails, only validate desktop & schema files
  meson test 'Validate desktop file' 'Validate schema file' -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
