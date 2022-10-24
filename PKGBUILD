# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Ben Poest <ben@poest.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=textpieces
pkgver=3.3.0
pkgrel=1
pkgdesc="Transform text without using random websites"
arch=('x86_64' 'aarch64')
url="https://github.com/liferooter/textpieces"
license=('GPL3')
depends=('json-glib' 'libadwaita' 'python-pyaml' 'gtksourceview5' 'libgee')
makedepends=('blueprint-compiler' 'python-gobject' 'gobject-introspection' 'meson' 'vala')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('d834dfa9e687622ebc46395a649457652a74b07964e32adaf5385c146e48e5f9fdaaa584439098ca253bbeaa99fdfd1951fa1d4aee880a73a99dafc993017117')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
