# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=khronos
pkgver=4.0.1
pkgrel=1
pkgdesc="Track each task's time in a simple inobtrusive way"
arch=('x86_64')
url="https://github.com/lainsce/khronos"
license=('GPL3')
depends=('json-glib' 'libadwaita' 'libgee')
makedepends=('meson' 'gobject-introspection' 'vala')
source=(${url}/archive/$pkgver.tar.gz)
b2sums=('a689258094540c5836276ac226fe1ab16a38a3784687efdee2558f1e49ae8f664f4a15f8a96e176198acde70d026ef63201767df092b53027d7dd851d1be6ef2')

build() {
  arch-meson ${pkgname%-git}-${pkgver} build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
