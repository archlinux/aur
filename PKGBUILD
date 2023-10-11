# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=eartag
pkgver=0.5.0
pkgrel=1
pkgdesc="Simple music tag editor"
arch=('any')
url="https://gitlab.gnome.org/World/eartag"
license=('MIT')
depends=('libadwaita' 'chromaprint' 'python-gobject' 'python-pyacoustid' 'python-pillow' 'python-mutagen' 'python-magic')
makedepends=('meson')
checkdepends=('appstream-glib' 'python-pytest')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('47cc4ad43bd3f07f00ee4954d5c6d2c6796db41c89be86c34b5074e686e5b7fa0d0d34620e1bddd747774e8bb2a33dfa3225b1680fc4e04f152a8ed7a9d080ab')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
