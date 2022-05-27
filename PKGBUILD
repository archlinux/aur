# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=wike
pkgver=1.8.0
pkgrel=1
pkgdesc="Wikipedia Reader for the GNOME Desktop"
arch=('any')
url="https://apps.gnome.org/app/com.github.hugolabe.Wike"
license=('GPL3')
depends=('libhandy' 'python-gobject' 'python-requests' 'webkit2gtk')
makedepends=('meson')
checkdepends=('appstream-glib')
changelog="$pkgname-changelog"
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugolabe/Wike/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9d6f893386efc4237856344cf995c0c9ef59469d91a0b110a882abe58ca51546')

build() {
  arch-meson Wike-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
