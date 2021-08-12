# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=lorem
pkgver=0.1
pkgrel=2
pkgdesc="Simple app to generate the Lorem Ipsum placeholder text"
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/lorem"
license=('GPL3')
depends=('gtk4' 'glib2' 'libadwaita')
makedepends=('git' 'meson' 'rust')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('909c89c123047c471cbb667c3bfb665844da280d1334d21780c9745e886d19b7')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
