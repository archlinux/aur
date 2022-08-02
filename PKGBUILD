# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=paper-note
pkgver=22.9
pkgrel=1
pkgdesc="A pretty note-taking app for GNOME"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/posidon_software/paper"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5' 'libgee')
makedepends=('meson' 'gobject-introspection' 'blueprint-compiler' 'vala')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/${pkgname%-note}-$pkgver.tar.gz)
b2sums=('0e57ffd3e0e4ce4d7bc20c8690c3bee1b7e4dc989a6bbf7b63e3175255edf0385ec0a19e122e5977e2949c7987e36819559c728c75e83397f9e59f79dd94fa63')

build() {
  arch-meson "${pkgname%-note}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
