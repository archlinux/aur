# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=whatip
pkgver=1.2
pkgrel=1
pkgdesc="Info on your IP"
arch=('any')
url="https://gabmus.gitlab.io/whatip"
license=('GPL-3.0-or-later')
depends=('iproute2' 'libadwaita' 'python-requests' 'python-netaddr' 'python-gobject')
makedepends=('blueprint-compiler' 'gobject-introspection' 'meson')
checkdepends=('appstream')
optdepends=('avahi: hostname resolution')
source=("https://gitlab.gnome.org/GabMus/whatip/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('645af543c58f1c048af19a085f9d6b17d2e627c21e1d2c9746eb4a3ade4a537a')

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
