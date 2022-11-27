# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=whatip
pkgver=1.1
pkgrel=2
pkgdesc="Info on your IP"
arch=('any')
url="https://gabmus.gitlab.io/whatip"
license=('GPL3')
depends=('iproute2' 'libadwaita' 'python-requests' 'python-netaddr' 'python-gobject')
makedepends=('blueprint-compiler' 'gobject-introspection' 'meson')
checkdepends=('appstream')
optdepends=('avahi: hostname resolution')
source=("https://gitlab.gnome.org/GabMus/whatip/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a13f02d8a805913e5603f7659c7932879da13afcbf2b8f728d6b6bba93aeb085')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
