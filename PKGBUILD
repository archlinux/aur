# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=pinapp
_pkgname=PinApp
pkgver=1.2.0
pkgrel=1
pkgdesc="Create your own application shortcuts"
arch=('any')
url="https://github.com/fabrialberio/PinApp"
license=('GPL3')
depends=('libadwaita' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('28cc7f058a34e6d8d67f074892527eb2594cb15e09ff8d998d57042f2dbd9bc35113ba11d5cc537e021cc03e688dda5216d25f947896ce9e3589a010423c92ad')

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
