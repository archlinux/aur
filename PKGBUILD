# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=emblem
pkgver=0.1.0
pkgrel=1
pkgdesc="Generate project avatars for your Matrix rooms an git forges"
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/emblem"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'glib2')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
sha512sums=('eadb526893f4b96ceb45953a6b94e40496922a170982d6f328e8786329c3cd8edc663f87a53735eeac33c3a19d0ff5f93e85b0ad24bbd96a9a96cb911c21cace')

build() {
  arch-meson "${pkgname%-git}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
