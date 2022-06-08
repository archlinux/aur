# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=paper-note
_pkgname=paper
pkgver=22.6
pkgrel=1
pkgdesc="A pretty note-taking app for GNOME"
arch=('x86_64')
url="https://gitlab.com/posidon_software/paper"
license=('GPL3')
depends=('glib2' 'libadwaita' 'gtksourceview5' 'libgee')
makedepends=('meson' 'gobject-introspection' 'blueprint-compiler' 'vala')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
b2sums=('40c311a1083779c8fa08e53684d34a3dd04faf877f25aa049d5143c10097e211cef85faf3d894d44f2888fa60fb5484da817f79dfb0b552b51a3881fa4bc2640')

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
