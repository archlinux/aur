# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=wike
pkgver=2.0.1
pkgrel=1
pkgdesc="Wikipedia Reader for the GNOME Desktop"
arch=('any')
url="https://apps.gnome.org/app/com.github.hugolabe.Wike"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'python-requests' 'webkitgtk-6.0')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugolabe/Wike/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b9a435ea648c8768b0ffc83222d67815aa3d7ee2677d0d0afae2b99aa15d5f13')

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
