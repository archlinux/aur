# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=pinapp
_pkgname=PinApp
pkgver=1.1.5
pkgrel=1
pkgdesc="Create your own application shortcuts"
arch=('any')
url="https://github.com/fabrialberio/PinApp"
license=('GPL3')
depends=('libadwaita' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/$pkgver.tar.gz)
b2sums=('cc4b736c10dc5ce5c97a74e38331f9f47c1b1e0eafdfcaf4595d8a7695bd62d2a3716bca0eb7cf3daefd8ecd65ceb5052bcc95414fef4295ddc8aafa05590aa6')

build() {
  arch-meson "${_pkgname%-git}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
