# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=paper-note
pkgver=22.11
pkgrel=1
pkgdesc="A pretty note-taking app for GNOME"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/posidon_software/paper"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5' 'libgee')
makedepends=('meson' 'gobject-introspection' 'blueprint-compiler' 'python-gobject' 'vala')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/${pkgname%-note}-$pkgver.tar.gz)
b2sums=('6760f8aacb8a23675c59ee5e337f02fa3c47bef2e79c4573fd8975cce6aba1f92c426feebdb959f8c631cb5a09623e5f36dbbe30d23a3ea99a655d4d064f15fb')

build() {
  arch-meson "${pkgname%-note}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
