# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=citations
pkgver=0.4.0
pkgrel=2
pkgdesc="Manage your bibliographies using the BibTeX format"
arch=('x86_64')
url="https://gitlab.gnome.org/World/citations"
license=('GPL3')
depends=('libadwaita-git' 'poppler' 'gtksourceview5')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('40aac7462a119e8303215603e1e5dfc3b41b79e951895886f7c64c6b25fefc570faa4b302d9a379dd4b31257cd38133d9dd509fc0e6a8eb83c4e51d667391bea')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
