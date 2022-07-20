# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=paper-note
_pkgname=paper
_app_id=io.posidon.Paper
pkgver=22.8
pkgrel=1
pkgdesc="A pretty note-taking app for GNOME"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/posidon_software/paper"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5' 'libgee')
makedepends=('meson' 'gobject-introspection' 'blueprint-compiler' 'vala')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
b2sums=('5d52f8c9319ece4ef020ac2d10e0b5b657aa0df0ea3d7685b45d32db8be5a5964730f3098f09526341545b8bcaeba0d7567d16a87fcdd163cd71012dfad04b84')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
  
  # Temporary solution to the issue: https://gitlab.com/posidon_software/paper/-/issues/36
  mv "$pkgdir/usr/share/applications/$_app_id.desktop" "$pkgdir/usr/share/applications/Paper.desktop"  
}
