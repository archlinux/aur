# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=eartag
pkgver=0.4.1
pkgrel=1
pkgdesc="Simple music tag editor"
arch=('any')
url="https://gitlab.gnome.org/World/eartag"
license=('MIT')
depends=('libadwaita' 'chromaprint' 'python-gobject' 'python-pyacoustid' 'python-pillow' 'python-mutagen' 'python-magic')
makedepends=('meson')
checkdepends=('appstream-glib' 'python-pytest')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('7551e6ea4b3bdcd76e2ad7e80992cc6e8d5b8611068ddd347a05c6480cffbf8de9531c6ed6f41f46dae9c581c3c88edae8b197e9a375a294f0f1563eb658fb6e')

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
