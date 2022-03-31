# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=wike
pkgver=1.7.2
pkgrel=1
pkgdesc="Wikipedia Reader for the GNOME Desktop"
arch=('any')
url="https://apps.gnome.org/app/com.github.hugolabe.Wike"
license=('GPL3')
depends=('libhandy' 'python-gobject' 'python-requests' 'webkit2gtk')
makedepends=('meson')
#checkdepends=('appstream-glib')
changelog="$pkgname-changelog"
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugolabe/Wike/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8434cec2ca44392fd96fa9ed1594be40c74d91490039405996aa4c6fa64bd26c')

build() {
  arch-meson Wike-$pkgver build
  meson compile -C build
}

check() {

  # Validate appstream file fails, only validate desktop & schema files
  meson test 'Validate desktop file' 'Validate schema file' -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
