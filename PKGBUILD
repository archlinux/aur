# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=eartag
pkgver=0.4.0
pkgrel=1
pkgdesc="Simple music tag editor"
arch=('any')
url="https://gitlab.gnome.org/knuxify/eartag"
license=('MIT')
depends=('libadwaita' 'chromaprint' 'python-gobject' 'python-pyacoustid' 'python-pillow' 'python-mutagen' 'python-magic')
makedepends=('meson')
checkdepends=('appstream-glib' 'python-pytest')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('62f1788f4a54e980de6cef1a652072575a38a8737bc4abbd091a3ea3951c7968e0e0e0b86b441c0dc0df8e3d284400bd0ddb277e8cdb4113e5f6baa12cb7d456')

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
