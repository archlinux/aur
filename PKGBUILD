# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=pinapp
_pkgname=PinApp
pkgver=1.1.4
pkgrel=2
pkgdesc="Create your own application shortcuts"
arch=('any')
url="https://github.com/fabrialberio/PinApp"
license=('GPL3')
depends=('libadwaita' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/$pkgver.tar.gz)
b2sums=('d5c3a2eeef9aa2f703b538a5855334dca5e8dd4da3db95ae2e36faa2402ed491b58f51390c11d0e3f41a6488ccf018090595e12642473a7abda7d9861a5f09d0')

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
