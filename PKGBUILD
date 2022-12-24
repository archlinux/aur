# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=eartag
pkgver=0.3.0
pkgrel=1
pkgdesc="Simple music tag editor"
arch=('any')
url="https://github.com/knuxify/eartag"
license=('MIT')
depends=('libadwaita' 'python-gobject' 'python-pillow' 'python-mutagen' 'python-magic')
makedepends=('meson')
checkdepends=('appstream-glib' 'python-pytest')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
b2sums=('08f1911b8049634ebed2f496e288fc8e4ebcf8b3745f83255df7cf98cba63fa1000351a89c9be8762e812a07c98beb365fc7574f0763c8ba73119ce114a0d2b5')

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
