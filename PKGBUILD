# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-cowsay
_pkgname=cowsay
pkgver=1.9.1
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
b2sums=('aca38465e1662fbc6776283551e5262d0c1ae75e02cf6dc1665f7e2da013a21f48542389f938a059feeca1106811ee0aae2b13dcc32dc4a9ecc7bdd9a15f7557')

build() {
  arch-meson "${_pkgname%-git}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
