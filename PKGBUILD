# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-cowsay
_pkgname=cowsay
pkgver=1.9.0
pkgrel=1
pkgdesc="A simple GNOME UI implementation of Cowsay"
arch=('x86_64')
url="https://gitlab.gnome.org/Eonfge/cowsay"
license=('GPL3')
depends=('gtk3' 'glib2' 'libgee' 'libsoup' 'json-glib' 'sqlite3')
makedepends=('meson')
checkdepends=('appstream-glib')
conflicts=('cowsay')
replaces=('cowsay')
source=($url/-/archive/$pkgver/${_pkgname%-git}-$pkgver.tar.gz)
sha512sums=('f03d77e8ec972538139c25d8ac38bec49ce02b40b6c6601bc06cb251da6d8be8acbd7a596a26d140042c699634317fcd89af791758dbbe391ec97e84d74d4330')

build() {
  arch-meson "${_pkgname%-git}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
