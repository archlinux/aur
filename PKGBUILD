# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Ben Poest <ben@poest.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=textpieces
pkgver=3.2.0
pkgrel=1
pkgdesc="Transform text without using random websites"
arch=('x86_64' 'aarch64')
url="https://github.com/liferooter/textpieces"
license=('GPL3')
depends=('json-glib' 'libadwaita' 'python-pyaml' 'gtksourceview5' 'libgee')
makedepends=('blueprint-compiler' 'gobject-introspection' 'meson' 'vala')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('85a771281a08099198e920dd5ca94b6fd97945d3d11a47a09981ae0d4b335d8fef1ed06ea384be113dabac9d05bc167c1a87328d790e6aa519eb3e7dd13cee03')

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
