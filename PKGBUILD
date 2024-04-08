# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=eartag
pkgver=0.6.0
pkgrel=1
pkgdesc="Simple music tag editor"
arch=('any')
url="https://gitlab.gnome.org/World/eartag"
license=('MIT')
depends=('libadwaita' 'chromaprint' 'python-gobject' 'python-pyacoustid' 'python-pillow' 'python-mutagen' 'python-magic')
makedepends=('meson')
checkdepends=('appstream-glib' 'python-pytest')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('cbd3a7642609304bffb84ba1f875269dc84c59ce295de653552ef03f21156bf307e33c2cdecc9780c655ede715c64e06ea0cd16bf68993849d1a6dc9f8ab441f')

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
