# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=paper-note
_pkgname=paper
pkgver=22.7
pkgrel=1
pkgdesc="A pretty note-taking app for GNOME"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/posidon_software/paper"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5' 'libgee')
makedepends=('meson' 'gobject-introspection' 'blueprint-compiler' 'vala')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
b2sums=('36c223e214a9aa229de06543514ba2e464d1aa3589e9d3bc8cf4148607430b998530804b4722aad31caf29eefe623606c60637581cf84647c3f26d0d79c8adef')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
