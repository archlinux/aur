# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Ben Poest <ben@poest.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=textpieces
pkgver=3.3.1
pkgrel=1
pkgdesc="Transform text without using random websites"
arch=('x86_64' 'aarch64')
url="https://github.com/liferooter/textpieces"
license=('GPL3')
depends=('json-glib' 'libadwaita' 'python-pyaml' 'gtksourceview5' 'libgee')
makedepends=('blueprint-compiler' 'python-gobject' 'gobject-introspection' 'meson' 'vala')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('fa219810487495d63c1981e511130b7af9fc45602ba9dfa3ef0d3829ff458f2313918153ee37795ad760849c58ad81e98916d9cbe89e293c7642392270965331')

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
