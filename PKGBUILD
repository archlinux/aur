# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=wike
pkgver=2.0.0
pkgrel=1
pkgdesc="Wikipedia Reader for the GNOME Desktop"
arch=('any')
url="https://apps.gnome.org/app/com.github.hugolabe.Wike"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'python-requests' 'webkitgtk-6.0')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugolabe/Wike/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3fbad2f9e197fe3b96012805edfc11a983f8b82f9b5a8614fe10ae72883e255a')

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
